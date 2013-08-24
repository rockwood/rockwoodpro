class UserMailer < ActionMailer::Base
  def password_reset_email(password_reset)
    @password_reset = password_reset
    mail(to: @password_reset.user.email, subject: 'Rockwood Productions - Password Reset')
  end
end