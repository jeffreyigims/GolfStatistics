class RoundHole < ApplicationRecord
    has_one :round 
    has_many :player_holes 
    has_many :players, through: :player_holes
    has_many :shots, through: :player_holes
    has_one :course, through: :round
    has_one :tournament, through: :round
end
