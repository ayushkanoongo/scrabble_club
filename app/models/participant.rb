class Participant < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :match
end