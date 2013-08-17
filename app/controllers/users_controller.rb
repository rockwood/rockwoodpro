class UsersController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    if user.save
      current_user = user
      redirect_to after_sign_in_path, notice: "Welcome to Rockwood Productions"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end