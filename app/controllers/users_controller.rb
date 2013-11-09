class UsersController < ApplicationController
  expose(:user, attributes: :user_params)

  def create
    if user.save
      sign_in(user)
      redirect_to after_sign_up_path, notice: "Welcome to Rockwood Productions! Request a recording now or come back later."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end