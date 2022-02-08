class Buddy < ApplicationRecord
  belongs_to :users
  before_save { self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A[1(]?[-]?\d{3}[-).]?\s?\d{3}[-.]?\d{4}\z/

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phone, format: { with: VALID_PHONE_REGEX }
  validates :age, numericality: { greater_than_or_equal_to: 0 }
end
