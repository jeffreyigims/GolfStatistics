class CreatePlayerHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :player_holes do |t|
      t.integer :hole_num
      t.integer :cNum
      t.integer :shots_taken 
      t.integer :par_day 
      t.integer :par_total
      t.references :round_hole
      t.references :player

      t.timestamps
    end
  end
end
