class Buddy < ApplicationRecord
  belongs_to :users
  before_save { self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A0(\d{1,4}[-]?\d{1,4}[-]?\d{4})\z|\A0[7-9]0[-]?\d{4}[-]?\d{4}\z/

  validate :first_name, presence: true, length: { maximum: 255 }
  validate :last_name, presence: true, length: { maximum: 255 }
  validate :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniquness: { case_sensitive: false }
  validate :phone, format: { with: VALID_PHONE_REGEX }
  validate :age, numerically: { greater_than_or_equal_to: 0 }
end
