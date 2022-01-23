class Match < ApplicationRecord
  # Associations
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants, allow_destroy: true

  # Validations
  validate :require_two_participants

  private
  def require_two_participants
    errors.add(:base, "You must provide two participants for a match") unless participants.size == 2
  end
end
