class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true, on: :create
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end