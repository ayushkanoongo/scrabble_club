class Participant < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :match

  # Enum
  enum status: [:lose, :win]

  # Validations
  validates :member_id, uniqueness: { scope: :match_id }
  validates :score, presence: true
end
