class CreateWeeklyProjections < ActiveRecord::Migration
  def change
    create_table :weekly_projections do |t|
      t.integer :rank
      t.integer :csv_id
      t.string :name
      t.string :pos
      t.string :team
      t.string :opp
      t.float :comp
      t.integer :pass_yards
      t.float :pass_td
      t.float :int
      t.float :att
      t.integer :rush_yards
      t.float :rush_td
      t.float :rec
      t.integer :rec_yards
      t.float :rec_td
      t.integer :fantasy_points
      t.timestamps null: false
    end
  end
end
