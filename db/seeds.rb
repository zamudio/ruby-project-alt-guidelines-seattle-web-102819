MusicArtist.destroy_all
User.destroy_all
Review.destroy_all



10.times do |i|
    MusicArtist.create(name: Faker::Music.unique.band, genre: Faker::Music.unique.genre, album: Faker::Music.unique.album)
end

10.times do |i|
    User.create(name: Faker::Name.unique.name, age: Faker::Number.number(digits: 2), email: Faker::Internet.unique.email)
end

10.times do |i|
    Review.create(review: Faker::Lorem.paragraph, rating: Faker::Number.number(digits: 1), user_id: User.all.sample.id, music_artist_id: MusicArtist.all.sample.id)
end