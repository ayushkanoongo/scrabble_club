class Member < ApplicationRecord
  # Validations
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, if: -> { email.present? }
  validates :address, length: { maximum: 150 }
  validates_uniqueness_of :phone
end
