class CommandLineInterface
    def greet
        puts '-------------------------------------------'
        puts '--- Welcome to Felp, review your music! ---'
        puts '-------------------------------------------'
    end

    def find_a_band
        puts "Looking for a band to review?"
        puts "Enter a band to search for them and create their review:"
        band_name = gets.chomp

        ma = MusicArtist.find_by(name: band_name)
        # puts "----------------------"
        # puts "----------------------"
        # puts "----------------------"
        # puts "----------------------"
        # puts "----------------------"
        # puts ma.name
        # a = ma.reviews
    end
end