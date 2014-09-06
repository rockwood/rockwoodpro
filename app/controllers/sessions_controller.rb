class SessionsController < ApplicationController
  def new
    flash[:error] = params[:error] if params[:error]
  end

  def create
    user = User.find_by_email(session_params[:email])
    if user && user.legacy?
      user.generate_password_reset
      return redirect_to edit_legacy_password_reset_path(user.password_reset_token)
    end

    if user && user.authenticate(session_params[:password])
      sign_in(user)
      redirect_to after_sign_in_path, notice: "Welcome back!"
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "See ya later"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
