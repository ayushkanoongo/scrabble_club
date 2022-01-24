class Match < ApplicationRecord
  # Associations
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants, allow_destroy: true

  # Validations
  validate :require_two_participants

  # Callbacks
  after_save :set_match_status

  private
  def require_two_participants
    errors.add(:base, "You must provide two participants for a match") unless participants.size == 2
  end

  def set_match_status
    participant_ids = self.participants.order(score: :desc).pluck(:id)
    Participant.where(id: participant_ids.shift).update(status: 'win')
    Participant.where(id: participant_ids).update(status: 'lose')
  end
end
