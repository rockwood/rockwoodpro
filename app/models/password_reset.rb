class PasswordReset < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  def self.create_with_token
    create(token: generate_token)
  end

  def url
    verify_password_reset_url(self, token: token)
  end

  private

  def self.generate_token
    SecureRandom.hex(16)
  end
end