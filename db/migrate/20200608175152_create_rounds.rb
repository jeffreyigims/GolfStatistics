class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :tournament
      t.references :course
      t.integer :round_num

      t.timestamps
    end
  end
end
