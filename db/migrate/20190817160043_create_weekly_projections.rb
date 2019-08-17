class CreateWeeklyProjections < ActiveRecord::Migration
  def change
    create_table :weekly_projections do |t|
      t.integer :Rank
      t.string :CSV_ID
      t.string :Name
      t.string :Pos
      t.string :Team
      t.string :Opp
      t.string :Comp
      t.string :PassYards
      t.float :PassTD
      t.string :Int
      t.string :Att
      t.string :RushYards
      t.float :RushTD
      t.string :Rec
      t.string :RecYards
      t.float :RecTD
      t.integer :FantasyPoints
      t.timestamps null: false
    end
  end
end
