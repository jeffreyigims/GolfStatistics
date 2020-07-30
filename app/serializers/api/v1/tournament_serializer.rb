module Api::V1
  class TournamentSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :tour_name, :pga_tournament_id, :tournament_name

    attribute :start do |object|
      object.start_date.nil? ? "N/A" : object.start_date.strftime("%m/%d/%Y")
    end

    attribute :end do |object|
      object.end_date.nil? ? "N/A" : object.end_date.strftime("%m/%d/%Y")
    end

    attribute :year

    attribute :rounds do |object|
      object.rounds.map do |round|
        RoundSerializer.new(round).serializable_hash
      end
    end
  end
end
