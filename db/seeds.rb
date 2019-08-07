require 'csv'


#CSV file from fantasysharks.com
csv_data = CSV.read('/Users/Nick/Development/ffl_app/db/seeds/25635_080620190117.csv')
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

puts "Player database created!"