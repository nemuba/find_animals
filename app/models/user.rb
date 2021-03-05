class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
