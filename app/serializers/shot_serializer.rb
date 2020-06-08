class ShotSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :shot_num, :time, :t, :prv, :tee, :cup, :from, :to, :asc, :dist, :left, :x, :y, :z, :club, :con, :shot_text
    
    attribute :hole do |object|
      object.round_hole.hole_num
    end
    
    attribute :round do |object|
      object.round_hole.player_round.round.round_num
    end
  
    attribute :course do |object|
        object.round_hole.player_round.round.course.course_name
    end
  
    attribute :tournament do |object|
        object.round_hole.player_round.round.tournament.tournament_name
    end
  
  end
  