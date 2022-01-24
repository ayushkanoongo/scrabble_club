class Member < ApplicationRecord

  # Associations
  has_many :participants, dependent: :destroy

  # Scopes
  scope :sort_by_created_at, -> { order(created_at: :desc) }

  # Validations
  validates :phone, presence: true, numericality: true, length: { is: 10 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, if: -> { email.present? }
  validates :address, length: { maximum: 150 }
  validates_uniqueness_of :phone

  # return full name of member
  def name
    first_name + last_name
  end

  # return count of wins and loses of member matches
  def match_details
    wins = 0; loses = 0;
    wins = participants.where(status: 'win').count
    loses = participants.where(status: 'lose').count
    [wins, loses]
  end

  def average_score
    if participants.count > 0
      member_scores = participants.pluck(:score)
      (member_scores.sum / member_scores.count).round
    end
  end

  def highest_score
    participant = participants.order(score: :desc).first
    return nil if participant.blank?

    match = participant.match
    another_palyer = match.participants.where.not(member_id: participant.member_id).last.member.name
    return { score: participant.score, match_code: match.id, match_time: match.created_at, another_player: another_palyer }
  end
end
