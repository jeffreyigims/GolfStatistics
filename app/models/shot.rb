class Shot < ApplicationRecord
  # Relationships
  belongs_to :player_hole
  has_one :player, through: :player_hole
  has_one :round_hole, through: :player_hole
end
