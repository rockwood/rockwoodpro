class PasswordResetEmail
  def sent_to?(email)
    result = ActionMailer::Base.deliveries.select.last
  end
end