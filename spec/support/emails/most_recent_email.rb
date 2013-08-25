class MostRecentEmail
  def self.sent_to?(email_address)
    email = ActionMailer::Base.deliveries.last
    email.to.include?(email_address)
  end

  def self.has_in_body?(text)
    email = ActionMailer::Base.deliveries.last
    text.present? && email.body.include?(text)
  end
end