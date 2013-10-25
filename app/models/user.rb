class User < ActiveRecord::Base
  has_many :recordings
  has_secure_password
  validates :password, presence: true, on: :create
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def generate_password_reset
    update_attributes(
      password_reset_token: generate_token,
      password_reset_expiration: 1.day.from_now)
  end

  def clear_password_reset
    update_attributes(
      password_reset_token: nil,
      password_reset_expiration: nil)
  end

  def verify_password_reset(token)
    password_reset_token == token && password_reset_expiration > Time.now
  end

  private

  def generate_token
    SecureRandom.hex(16)
  end
end