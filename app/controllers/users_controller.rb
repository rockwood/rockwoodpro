class UsersController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    if user.save
      redirect_to '/', notice: "Welcome to Rockwood Productions"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end