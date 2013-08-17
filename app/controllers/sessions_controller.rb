class SessionsController < ApplicationController
  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      current_user = user
      redirect_to after_sign_in_path, :notice => "Welcome back!"
    else
      flash[:notice] = "Invalid email or password"
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end