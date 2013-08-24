class PasswordResetsController < ApplicationController
  expose(:password_reset)

  def create
    user = User.find_by_email(password_reset_params[:email])
    if user && user.send_password_reset
      flash[:success] = "Password reset sent to: #{user.email}"
      redirect_to root_path
    else
      flash[:notice] = "Oops, we don't have that email in our system. Perhaps you used another?"
      render :new
    end
  end

  def password_reset_params
    params.require(:password_reset).require(:user).permit(:email)
  end
end