class Course < ApplicationRecord
    has_many :rounds
    has_many :round_holes, through: :rounds
    has_many :tournaments, through: :rounds
end
