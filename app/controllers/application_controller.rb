class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : User.new
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
    return redirect_to root_path, alert: "Please sign in" if current_user.new_record?
  end

  def require_admin_login
    return redirect_to '/' unless current_user.admin?
    require_login
  end

  def current_admin_user
    return nil unless current_user.admin?
    current_user
  end

  def after_sign_in_path
    if current_user.admin?
      admin_recordings_path    
    else
      app_path
    end
  end

  def after_sign_up_path
    "/app/recording/new"
  end
end
