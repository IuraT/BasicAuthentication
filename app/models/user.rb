# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :email, :name, :surname, presence: true

  private

  def downcase_email
    email.downcase!
  end
end
