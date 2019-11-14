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

        sound = Music.new('looperman-l-0630386-0183461-joefunktastic-rewind-retro-80s-style-synth-75bm.wav')
        sound.play

        puts "Press enter to continue..."
        input = gets.chomp
        sound.stop
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
        puts "(5) Find All User Reviews"
        puts ""
        puts "(6) Find All Reviews Related to Band"
        puts ""
        puts "(7) Edit User"
        puts ""
        puts "(8) Edit Review"
        puts ""
        puts "(9) Delete Review"
        puts ""
        puts "(10) Delete User"
        puts ""
        puts "Type 'Exit' to quit program..."
        space_helper(2)
        puts "Select the number for the option you want:"

        while true
            input = gets.chomp
            if input == '1'
                create_user
                break
            elsif input == '2'
                #FIX
                # create_review
                break
            elsif input == '3'
                find_band
                break
            elsif input == '4'
                find_user
                break
            elsif input == '5'
                #FIX
                # find_all_user_reviews
                break
            elsif input == '6'
                #FIX
                # find_all_band_reviews
                break
            elsif input == '7'
                #FIX
                # edit_user
                break
            elsif input == '8'
                #FIX
                # edit_review
                break
            elsif input == '9'
                #FIX
                # delete_user
                break
            elsif input == '10'
                #FIX
                # delete_review
                break
            elsif input.downcase == 'exit'
                break
            else
                space_helper(2)
                puts 'Oops! Command not found. Please enter the number for the option you want...'
            end
        end
    end

    def find_user
        while true
            space_helper(21)
            puts "Find a User!"
            puts "Type exit at any time to quit..."
            puts ""
            puts "Enter the name of the User you'd like to find:"
            name_input = gets.chomp
            name_input = name_input.downcase
            
            if name_input.downcase == 'exit'
                options
                break
            end

            @user = User.find_by(name: name_input.titleize)
            if @user == nil
                space_helper(22)
                puts "User not found. Create a new User from options menu!"
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                if fail_input.downcase == ''
                    break
                end
                break
            else
                space_helper(20)
                puts "FOUND THE USER: #{@user.name}"
                space_helper(2)
                puts "Press enter to return to main menu"
                return_input = gets.chomp
            end
            break
        end
        options
    end

    def find_band
        while true
            space_helper(21)
            puts "Find a Band!"
            puts "Type exit at any time to quit..."
            puts ""
            puts "Enter the name of the Band you'd like to find:"
            band_name_input = gets.chomp
            band_name_input = band_name_input.downcase
            
            if band_name_input.downcase == 'exit'
                options
                break
            end

            @band = MusicArtist.find_by(name: band_name_input.titleize)
            if @band == nil
                space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                if fail_input.downcase == ''
                    break
                end
                break
            else
                space_helper(20)
                puts "FOUND THE BAND: #{@band.name}"
                space_helper(2)
                puts "Press enter to return to main menu"
                return_input = gets.chomp
            end
            break
        end
        options
    end

    def create_user
        while true
            space_helper(21)
            puts "Create a new user profile!"
            puts "Type exit to quit"
            puts ""
            puts "First, let's enter your name:"
            name_input = gets.chomp

            if name_input.downcase == 'exit'
                options
                break
            end

            puts ""
            puts "Next, let's enter your age:"
            age_input = gets.chomp

            if age_input.downcase == 'exit'
                options
                break
            end

            puts ""
            puts "Last step, let's enter your email:"
            email_input = gets.chomp

            if email_input.downcase == 'exit'
                options
                break
            end

            User.create(:name => name_input, :age => age_input, email: email_input)
            options
            break
        end
    end

    def create_review
        # FIX FIX FIX FIX FIX
        #
        # while true
        #     space_helper(21)
        #     puts "Create a new review!"
        #     puts "Type exit to quit"
        #     puts ""
        #     puts "First, let's enter your name:"
        #     name_input = gets.chomp

        #     if name_input.downcase == 'exit'.downcase
        #         options
        #         break
        #     end

        #     puts ""
        #     puts "Next, let's enter your age:"
        #     age_input = gets.chomp

        #     if age_input == 'exit'
        #         options
        #         break
        #     end

        #     puts ""
        #     puts "Last step, let's enter your email:"
        #     email_input = gets.chomp

        #     if email_input == 'exit'
        #         options
        #         break
        #     end

        #     User.create(:name => name_input, :age => age_input, email: email_input)
        #     options
        #     break
        # end
    end

    def find_all_user_reviews
    end

    def find_all_band_reviews
    #     puts "Looking for a band to review?"
    #     puts "Enter a band to search for them and create their review:"
    #     band_name = gets.chomp

    #     # ma = MusicArtist.find_by(name: band_name)
    #     # puts ma.reviews
    end

    def edit_user
    end

    def edit_review
    end

    def delete_user
    end

    def delete_review
    end
end