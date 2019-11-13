class CommandLineInterface
    def greet
        puts " ____                   _                                                 _          _ "
        puts "|  _ \\    ___  __   __ (_)   ___  __      __    _ __ ___    _   _   ___  (_)   ___  | |"
        puts "| |_) |  / _ \\ \\ \\ / / | |  / _ \\ \\ \\ /\\ / /   | '_ ` _ \\  | | | | / __| | |  / __| | |"
        puts "|  _ <  |  __/  \\ V /  | | |  __/  \\ V  V /    | | | | | | | |_| | \\__ \\ | | | (__  |_|"
        puts "|_| \\_\\  \\___|   \\_/   |_|  \\___|   \\_/\\_/     |_| |_| |_|  \\__,_| |___/ |_|  \\___| (_)"
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Hit any button to continue..."
        input = gets.chomp
    end

    def options
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
    end

    def find_a_bands_review
        puts "Looking for a band to review?"
        puts "Enter a band to search for them and create their review:"
        band_name = gets.chomp

        # ma = MusicArtist.find_by(name: band_name)
        # puts ma.reviews
    end
end