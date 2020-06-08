class CreateRoundHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :round_holes do |t|
      t.integer :pga_hole_id
      t.integer :par 
      t.integer :distance 
      t.integer :stimp
      t.references :round

      t.timestamps
    end
  end
end
