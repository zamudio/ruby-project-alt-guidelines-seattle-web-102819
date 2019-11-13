class CommandLineInterface
    def greet
        puts ""
        puts ""
        puts ""
        puts ""
        puts '-------------------------------------------'
        puts '--- Welcome to Felp, review your music! ---'
        puts '-------------------------------------------'
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Hit any button to continue..."
        input = gets.chomp
    end

    def options
    end

    def find_a_bands_review
        puts "Looking for a band to review?"
        puts "Enter a band to search for them and create their review:"
        band_name = gets.chomp

        ma = MusicArtist.find_by(name: band_name)
        puts ma.reviews
    end
end