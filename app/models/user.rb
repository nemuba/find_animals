# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true

  has_many :animals, dependent: :destroy

  def self.default_scope
    includes([:animals])
  end
end
