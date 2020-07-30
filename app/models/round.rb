class Round < ApplicationRecord
  # Relationships
  belongs_to :course
  belongs_to :tournament
  has_many :round_holes
  has_many :player_rounds, through: :round_holes
end
