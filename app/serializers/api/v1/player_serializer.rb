module Api::V1
  class PlayerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :first_name, :last_name, :pga_player_id
  end
end
