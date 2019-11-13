class CreateMusicArtists < ActiveRecord::Migration[5.2]
    def change
        create_table :music_artists do |b|
            b.string :name
            b.string :genre
            b.string :album
        end
    end
end