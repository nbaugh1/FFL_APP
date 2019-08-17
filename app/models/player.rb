class Player < ActiveRecord::Base
  belongs_to :team
  require "nokogiri"
  require "open-uri"
  require "csv"
  require "json"

  BASE_URL = "https://www.fantasysharks.com/players/playerpage.php?PID="

  attr_accessor :profile_page_doc, :data

  def scrape_profile
    Nokogiri::HTML(open("#{BASE_URL}#{self.csv_id}"))
  end

  def weekly_projections
    json_file = File.read("db/seeds/weekly_data.json")
    json_array = JSON.parse(json_file, :symbolize_names => true).flatten
    @data = json_array
  end
end
