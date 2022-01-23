class Member < ApplicationRecord

  # Associations
  has_many :participants, dependent: :destroy

  # Validations
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, if: -> { email.present? }
  validates :address, length: { maximum: 150 }
  validates_uniqueness_of :phone

  def name
    first_name + last_name
  end
end
