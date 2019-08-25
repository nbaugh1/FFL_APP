require "csv"

#CSV file from fantasysharks.com
csv_data = CSV.read("/Users/Nick/Development/ffl_app/db/seeds/25635_080620190117.csv")
csv_data.shift
csv_data.shift
csv_data.each do |row|
  p = Player.create
  p.rank = row[0].to_i
  p.csv_id = row[1].to_i
  p.last_name = row[2]
  p.first_name = row[3]
  p.position = row[4]
  p.nfl_team = row[5]
  p.points = row[6].to_i
  p.vbd = row[7].to_f
  p.bye_week = row[8].to_i
  p.save
end

wp_csv_data = File.read("lib/weekly_data.csv")
wp_csv_data = wp_csv_data.gsub(/\n/, " ")
wp_csv_info = CSV.parse(wp_csv_data)
wp_csv_info[0][0..16] = nil
wp_csv_info.each do |row|
  wp = WeeklyProjection.new
  wp.rank = row[0].to_i
  wp.pos = row[1]
  wp.csv_id = row[2].to_i
  wp.name = row[3]
  wp.team = row[4]
  wp.opp = row[5]
  wp.comp = row[6].to_f
  wp.pass_yards = row[7].to_i
  wp.pass_td = row[8].to_f
  wp.int = row[9].to_f
  wp.att = row[10].to_f
  wp.rush_yards = row[11].to_i
  wp.rush_td = row[12].to_f
  wp.rec = row[13].to_f
  wp.rec_yards = row[14].to_i
  wp.rec_td = row[15].to_f
  wp.fantasy_points = row[16].to_i
  wp.save
end

puts "Player database created!"
