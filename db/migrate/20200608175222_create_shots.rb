class CreateShots < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.integer :shot_num
      t.datetime :time
      t.string :t
      t.string :prv
      t.string :tee
      t.string :cup
      t.string :from
      t.string :to
      t.string :asc
      t.integer :dist
      t.integer :left
      t.integer :x
      t.integer :y
      t.integer :z
      t.string :club
      t.string :con
      t.string :shot_text
      t.references :player_hole

      t.timestamps
    end
  end
end
