require 'reloader'

class HomeController < ApplicationController

  include ActionController::Live

  def index
  end

  def update
    redis = Redis.new

    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      redis.subscribe(:test) do |on|

        on.subscribe do |channel, subscriptions|
          puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
        end

        on.message do |channel, message|
          puts "In message"
          puts "##{channel} - #{message}"
          sse.write({ data: message }, :event => "notification")
        end
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end
end
