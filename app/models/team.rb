class Team < ActiveRecord::Base
    has_many :players
    #belongs_to :league
    belongs_to :user
end
