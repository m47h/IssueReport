class ApplicationController < ActionController::Base # :nodoc:
  before_action :authenticate_user!
  protect_from_forgery with: :exception
end
