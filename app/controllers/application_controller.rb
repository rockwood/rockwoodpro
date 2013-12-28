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

  def sign_out
    session[:user_id] = nil
    @current_user = nil
  end

  def require_login
    return redirect_to root_path, alert: "Please sign in" if current_user.blank?
  end

  def require_admin_login
    return redirect_to '/' if current_user.present? && !current_user.admin?
    require_login
  end

  def current_admin_user
    return nil if current_user.present? && !current_user.admin?
    current_user
  end

  def after_sign_in_path
    return admin_dashboard_path if current_user.admin?
    app_path
  end

  def after_sign_up_path
    new_recording_path
  end
end
