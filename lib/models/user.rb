class User < ActiveRecord::Base
    has_many :reviews
    has_many :music_artists, through: :reviews
end