class Player < ActiveRecord::Base
    belongs_to :team
    require 'nokogiri'
    require 'open-uri'
    BASE_URL = "https://www.fantasysharks.com/players/playerpage.php?PID="
    
    attr_accessor :profile_page_doc
    
    def self.doc
        @profile_page_doc = Nokogiri::HTML(open("#{BASE_URL}/#{self.csv_id}"))
    end
end
