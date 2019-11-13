class Review < ActiveRecord::Base
    belongs_to :music_artist
    belongs_to :user
end