module Api::V1
  class RoundHoleSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :par, :distance, :stimp
  end
end
