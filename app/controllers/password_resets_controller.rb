class PasswordResetsController < ApplicationController
  expose(:user, attributes: :user_params) { find_user }

  def create
    user = User.find_by_email(user_params[:email])
    if user && user.send_password_reset_email
      flash[:success] = "Password reset sent to: #{user.email}. Please check your email."
      redirect_to root_path
    else
      flash[:notice] = "Oops, we don't have that email in our system. Perhaps you used another?"
      render :new
    end
  end

  def edit
    if !user.verify_password_reset(params[:id])
      flash[:notice] = "Your password reset key is incorrect or has expired. Please try again."
      return redirect_to new_password_reset_path
    end
  end

  def update
    if user.save
      user.clear_password_reset
      sign_in(user)
      flash[:notice] = "Congratulations! Your password has been reset"
      redirect_to after_sign_in_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
    return User.find_by_password_reset_token(params[:id])
    User.new
  end
end