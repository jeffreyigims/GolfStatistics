class PlayerHole < ApplicationRecord
  # Relationships
  has_many :shots
  belongs_to :player
  belongs_to :round_hole
  has_one :round, through: :round_hole
end
