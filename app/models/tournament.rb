class Tournament < ApplicationRecord
  # Relationships
  has_many :rounds
  has_many :courses, through: :rounds
  has_many :round_holes, through: :rounds
end
