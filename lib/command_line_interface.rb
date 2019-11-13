class CommandLineInterface
    def space_helper(num)
        num.times do
            puts ""
        end
    end

    def greet
        puts " ____                   _                                                 _          _ "
        puts "|  _ \\    ___  __   __ (_)   ___  __      __    _ __ ___    _   _   ___  (_)   ___  | |"
        puts "| |_) |  / _ \\ \\ \\ / / | |  / _ \\ \\ \\ /\\ / /   | '_ ` _ \\  | | | | / __| | |  / __| | |"
        puts "|  _ <  |  __/  \\ V /  | | |  __/  \\ V  V /    | | | | | | | |_| | \\__ \\ | | | (__  |_|"
        puts "|_| \\_\\  \\___|   \\_/   |_|  \\___|   \\_/\\_/     |_| |_| |_|  \\__,_| |___/ |_|  \\___| (_)"
        space_helper(4)
        puts "Hit any button to continue..."
        input = gets.chomp
    end

    def options
        puts "(1) Create User"
        puts ""
        puts "(2) Create Review"
        puts ""
        puts "(3) Find Band"
        puts ""
        puts "(4) Find User"
        puts ""
        puts "(5) Find all user reviews"
        puts ""
        puts "(6) Edit User"
        puts ""
        puts "(7) Edit review"
        puts ""
        puts "(8) Find all reviews related to band"
        puts ""
        puts "(9) Delete Review"
        puts ""
        puts "(10) Delete User"
        puts ""
        puts "Type 'Exit' to quit program..."
        puts ""
        puts ""
        puts "Select the number for the option you want:"

        while true
            input = gets.chomp
            if input == '1'
                create_user
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
                #FIX
                break
            elsif input.downcase == 'exit'.downcase
                break
            else
                puts ""
                puts ""
                puts 'Oops! Command not found. Please press the number for the option you want...'
            end
        end
    end

    def create_user
        while true
            space_helper(21)
            puts "Create a new user profile!"
            puts "Type exit to quit"
            puts ""
            puts "First, let's enter your name:"
            name_input = gets.chomp

            if name_input.downcase == 'exit'.downcase
                break
            end

            puts ""
            puts "Next, let's enter your age:"
            age_input = gets.chomp

            if age_input == 'exit'
                break
            end

            puts ""
            puts "Last step, let's enter your email:"
            email_input = gets.chomp

            if email_input == 'exit'
                break
            end

            User.create(:name => name_input, :age => age_input, email: email_input)
            options
            break
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