class CreatePlayers < ActiveRecord::Migration
  
  def change
    create_table :players do |t|
      t.integer :rank
      t.integer :csv_id
      t.string :last_name
      t.string :first_name
      t.string :position
      t.string :nfl_team
      t.integer :points
      t.float :vbd
      t.integer :bye_week
      t.timestamps null: false
    end
  end
end
