module Api::V1
  class CourseSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :pga_course_id, :course_name, :par_total, :distance_total
  end
end
