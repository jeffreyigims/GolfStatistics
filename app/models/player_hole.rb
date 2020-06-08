class PlayerHole < ApplicationRecord
    has_many :shots 
    has_one :player 
    has_one :round_hole
    has_one :round, through: :round_hole
end
