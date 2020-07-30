class Player < ApplicationRecord
  # Relationships
  has_many :player_holes
  has_many :shots, through: :player_holes
  has_many :round_holes, through: :player_holes
end
