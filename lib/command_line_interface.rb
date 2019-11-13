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
        puts "(1) Create User"
        puts ""
        puts "(2) Create Review"
        puts ""
        puts "(3) Find Band"
        puts ""
        puts "(4) Find all user reviews"
        puts ""
        puts "(5) Edit User"
        puts ""
        puts "(6) Edit review"
        puts ""
        puts "(7) Find all reviews related to band"
        puts ""
        puts "(8) Delete Review"
        puts ""
        puts "(9) Delete User"
        puts ""
        puts "(10) Exit program..."
        puts ""
        puts ""
        puts "Select the number for the option you want:"

        while true
            input = gets.chomp
            if input == '1'
                #FIX
                break
            elsif input == '2'
                #FIX
                break
            elsif input == '3'
                #FIX
                break
            elsif input == '4'
                #FIX
                break
            elsif input == '5'
                #FIX
                break
            elsif input == '6'
                #FIX
                break
            elsif input == '7'
                #FIX
                break
            elsif input == '8'
                #FIX
                break
            elsif input == '9'
                #FIX
                break
            elsif input == '10'
                break
            else
                puts ""
                puts ""
                puts 'Oops! Command not found. Please press the number for the option you want...'
            end
        end
    end

    def find_a_bands_review
        puts "Looking for a band to review?"
        puts "Enter a band to search for them and create their review:"
        band_name = gets.chomp

        # ma = MusicArtist.find_by(name: band_name)
        # puts ma.reviews
    end
end