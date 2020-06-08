class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :tour_code
      t.string :tour_name
      t.string :pga_tournament_id
      t.string :tournament_name
      t.datetime :start_date
      t.datetime :end_date
      t.string :year

      t.timestamps
    end
  end
end
