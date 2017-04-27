class ApplicationController < ActionController::Base # :nodoc:
  include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # Pundit
  scoped = [:index, :search]
  after_action :verify_authorized, except: scoped, unless: :devise_controller?
  after_action :verify_policy_scoped, only: scoped, unless: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def pundit_user
    current_user
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end
end
