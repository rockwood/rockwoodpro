class UserMailer < ActionMailer::Base
  default from: 'kevin@rockwoodpro.com'
  add_template_helper(ApplicationHelper)

  def password_reset(user)
    @user = user
    @password_reset_url = edit_password_reset_url(@user.password_reset_token)
    mail(to: @user.email, subject: 'Rockwood Productions - Password Reset')
  end
end