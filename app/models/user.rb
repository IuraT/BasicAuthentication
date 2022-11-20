class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :email, :name, :surname, presence: true

  private

  def downcase_email
    self.email.downcase!
  end
end
