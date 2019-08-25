class Player < ActiveRecord::Base
  belongs_to :team
  require "nokogiri"
  require "open-uri"
  require "csv"
  require "json"

  BASE_URL = "https://www.fantasysharks.com/players/playerpage.php?PID="

  attr_accessor :profile_page_doc, :data, :projection

  def scrape_profile
    Nokogiri::HTML(open("#{BASE_URL}#{self.csv_id}"))
  end

  def projections
    WeeklyProjection.find_by(csv_id: self.csv_id)
  end
end
