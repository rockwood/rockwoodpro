class PasswordResetsController < ApplicationController
  expose(:user, attributes: :user_params, finder: :find_by_password_reset_token)

  def create
    user = User.find_by_email(user_params[:email])
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
    if user.blank? || !user.verify_password_reset(params[:id])
      return redirect_to new_password_reset_path, alert: "Reset token is incorrect or has expired."
    end
  end

  def update
    user.legacy = false
    if user.save
      user.clear_password_reset
      sign_in(user)
      redirect_to after_sign_in_path, notice: "Congratulations! Your password has been reset."
    else
      flash[:alert] = "Opps, please try again"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
