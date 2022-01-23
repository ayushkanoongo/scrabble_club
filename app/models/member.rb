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
    match_ids = self.participants.pluck(:match_id).uniq
    wins = 0; loses = 0;
    Match.where(id: match_ids).each do |match|
      match.participants.order('score DESC').first.member_id == self.id ? wins += 1 : loses += 1
    end
    [wins, loses]
  end
end
