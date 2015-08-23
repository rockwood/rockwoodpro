class PasswordResetsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user
      user.generate_password_reset
      UserMailer.password_reset(user).deliver_now
      redirect_to root_path, notice: "Password reset sent to: #{user.email}."
    else
      flash[:alert] = "That email doesn't seem to be here. Perhaps you used another?"
      render :new
    end
  end

  def edit
    user = User.find_by(password_reset_token: params[:id])
    if user.blank? || !user.verify_password_reset(params[:id])
      return redirect_to new_password_reset_path, alert: "Reset token is incorrect or has expired."
    end
  end

  def update
    user = User.find_by(password_reset_token: params[:id])
    if user.update(user_params.merge(legacy: false))
      user.clear_password_reset
      sign_in(user)
      redirect_to after_sign_in_path, notice: "Congratulations! Your password has been reset."
    else
      flash[:alert] = "Opps, something went wrong. Please try again"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
