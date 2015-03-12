class HomeController < ApplicationController
  include ActionController::Live
  require "#{Rails.root}/app/models/MyERB.rb"
  around_action :set_site

  def set_site
    @a = Thread.new{ self.index }
    # response.

  end

  def index


    # Thread.new { home.index }
    # res.stream.await
    # [res.status, res.headers, res.stream]
    response.stream.write ""
    


    @welcome = "hello"
    # response.stream.write ''
    File.readlines("#{Rails.root}/app/views/home/index.html.erb").each do |line|

      doc = ERB.new(line, nil, nil, "temp").result(binding)
      p doc
      response.stream.write doc

    end



    response.stream.close
  end



end

class Line
  attr_accessor :line
  def initialize
    @line
  end
end
