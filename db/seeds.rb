MusicArtist.destroy_all
User.destroy_all
Review.destroy_all
MusicArtist.reset_pk_sequence
User.reset_pk_sequence
Review.reset_pk_sequence


10.times do |i|
    MusicArtist.create(name: Faker::Music.unique.band, genre: Faker::Music.genre, album: Faker::Hipster.unique.sentence)
end

10.times do |i|
    User.create(name: Faker::Name.unique.name, age: Faker::Number.number(digits: 2), email: Faker::Internet.unique.email)
end

10.times do |i|
    Review.create(review: Faker::TvShows::BojackHorseman.unique.quote, rating: Faker::Number.number(digits: 1), user_id: User.all.sample.id, music_artist_id: MusicArtist.all.sample.id)
end