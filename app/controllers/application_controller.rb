class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_color
  def set_color

    session[:color] ||= rand(0xffffff).to_s(16)
  end
end
