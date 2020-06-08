class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :pga_course_id
      t.string :course_code
      t.string :course_name
      t.integer :par_in
      t.integer :par_out
      t.integer :par_total
      t.integer :distance_in
      t.integer :distance_out
      t.integer :distance_total

      t.timestamps
    end
  end
end
