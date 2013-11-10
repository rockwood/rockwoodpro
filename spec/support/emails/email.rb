class Email
  def self.recipients
    ActionMailer::Base.deliveries.collect(&:to).flatten
  end

  def self.last
    ActionMailer::Base.deliveries.last
  end

  def self.clear
    ActionMailer::Base.deliveries.clear
  end
end