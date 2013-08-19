class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def require_login
    redirect_to root_path and return if current_user.blank?
  end

  def after_sign_in_path
    recordings_path
  end

  def after_sign_up_path
    new_recording_path
  end
end
