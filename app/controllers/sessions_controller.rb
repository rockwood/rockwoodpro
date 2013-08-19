class SessionsController < ApplicationController
  def create
    user = User.find_by_email(session_params[:email])
    if user && user.authenticate(session_params[:password])
      sign_in(user)
      redirect_to after_sign_in_path, notice: "Welcome back!"
    else
      flash[:notice] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    current_user = nil
    redirect_to root_path, notice: "See ya later"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end