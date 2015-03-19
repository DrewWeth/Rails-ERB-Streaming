require 'reloader'
require 'json'


class HomeController < ApplicationController

  include ActionController::Live

  def index
    @messages = Message.last(100).reverse
  end

  #POST
  def submit

    if not params["message"].blank? and params["message"].length <= 200
      redis = Redis.new

      message = HTML::FullSanitizer.new.sanitize(params["message"]).capitalize
      color = session[:color]

      Message.create(:message => message, :color => color)

      obj = {:message => message, :color => color}
      pub = redis.publish :message, obj.to_json


      render :json => obj
    end
    render :json => "fail"
  end

  def update
    redis = Redis.new

    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      redis.subscribe(:notification, :message) do |on|

        on.subscribe do |channel, subscriptions|
          puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
        end

        on.message do |channel, message|
          if channel == "notification"
          elsif channel == "message"

            puts "Channel (#{channel}) - #{message}"
            puts parsed_message = JSON.parse(message)
            # puts parsed_message.class

            sse.write({:message => parsed_message["message"], :color => parsed_message["color"]}, :event => "message")
          end
        end
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end
end
