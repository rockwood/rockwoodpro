class User < ActiveRecord::Base
  has_many :recordings
  has_secure_password
  validates :password, presence: true, on: :create
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def send_password_reset
    password_reset = password_resets.create_with_token
    UserMailer.password_reset_email(password_reset).deliver
  end
end