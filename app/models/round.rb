class Round < ApplicationRecord
    has_one :course
    has_one :tournament
    has_many :round_holes 
    has_many :player_rounds, through: :round_holes
end
