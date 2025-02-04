class CommandLineInterface
    def space_helper(num)
        #helper function to create formatting spaces
        num.times do
            puts ""
        end
    end

    def user_info(input)
        #helper function to find user object
        @user = User.find_by(name: input.titleize)
    end

    def band_info(input)
        #helper function to find band object
        @band = MusicArtist.find_by(name: input.titleize)
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
        puts "(3) Find A Band"
        puts ""
        puts "(4) Find Average Rating Of A Band"
        puts ""
        puts "(5) List All Bands"
        puts ""
        puts "(6) Find All Reviews Related To A Band"
        puts ""
        puts "(7) Find All Your User Reviews"
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
                create_review
                break
            elsif input == '3'
                find_band
                break
            elsif input == '4'
                avg_rating_of_band
                break
            elsif input == '5'
                list_all_bands
                break
            elsif input == '6'
                find_all_band_reviews
                break
            elsif input == '7'
                find_all_user_reviews
                break
            elsif input == '8'
                edit_review
                break
            elsif input == '9'
                delete_review
                break
            elsif input == '10'
                delete_user
                break
            elsif input.downcase == 'exit'
                break
            else
                space_helper(2)
                puts 'Oops! Command not found. Please enter the number for the option you want...'
            end
        end
    end

    def avg_rating_of_band
        while true
            space_helper(21)
            puts "Find the average rating for any band!"
            puts "Type exit at any time to quit..."
            space_helper(2)
            puts "Enter the name of the Band you'd like to find:"
            band_name_input = gets.chomp
            band_name_input.downcase
            if band_name_input.downcase == 'exit'
                options
                break
            end
            band_info(band_name_input)
            if @band == nil
                space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to main menu..."
                fail_input = gets.chomp
                options
                break
            else
                avg = []
                all_reviews = Review.where(music_artist_id: @band.id)
                if all_reviews.empty?
                    space_helper(22)
                    puts "No current rating for #{@band.name} :("
                    puts ""
                    puts "Press enter to return to main menu..."
                    fail_input = gets.chomp
                    options
                    break
                else
                    all_reviews.each do |r|
                        avg << r.rating
                    end
                    avg_rating = (avg.reduce(:+).to_f / avg.size).round(1)
                    space_helper(2)
                    puts "The average rating for #{@band.name} is #{avg_rating}"
                end
            end
            space_helper(2)
            puts "Press enter to return to main menu"
            return_input = gets.chomp
            options
            break
        end
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
            band_info(band_name_input)
            if @band == nil
            space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to main menu..."
                fail_input = gets.chomp
                if fail_input.downcase == ''
                    options
                end
            else
                space_helper(20)
                puts "FOUND THE BAND: #{@band.name}, genre: #{@band.genre}, album: #{@band.album}"
                space_helper(2)
                puts "Press enter to return to main menu..."
                return_input = gets.chomp
                options
            end
        end
    end

    def list_all_bands
        space_helper(17)
        puts "ALL KNOWN BANDS:"
        space_helper(2)
        all_bands = MusicArtist.all
        all_bands.each do |band|
            puts band.name
        end
        space_helper(2)
        puts "Press enter to return to main menu..."
        return_input = gets.chomp
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
            name_input.downcase
            if name_input == 'exit'
                options
                break
            end
            puts ""
            puts "Next, let's enter your age:"
            age_input = gets.chomp
            age_input.downcase
            if age_input == 'exit'
                options
                break
            end
            puts ""
            puts "Last step, let's enter your email:"
            email_input = gets.chomp
            email_input.downcase
            if email_input == 'exit'
                options
                break
            end
            User.create(:name => name_input.titleize, :age => age_input.titleize, :email => email_input)
            options
            break
        end
    end

    def create_review
        while true
            space_helper(21)
            puts "Create a new review!"
            puts "Type exit to quit"
            puts ""
            puts "First, let's enter your name:"
            user_name_input = gets.chomp
            user_name_input = user_name_input.downcase
            if user_name_input == 'exit'
                options
                break
            end
            user_info(user_name_input)
            if @user == nil
                space_helper(22)
                puts "User not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            else
                user_name_id = @user.id
            end
            puts ""
            puts "Next, let's enter the name of the band you'd like to review:"
            band_name_input = gets.chomp
            band_name_input.downcase
            if band_name_input == 'exit'
                options
                break
            end
            band_info(band_name_input)
            if @band == nil
                space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            else
                band_name_id = @band.id
            end
            puts ""
            puts "Next, let's rate the band from 0 to 10:"
            rating_input = gets.chomp
            if rating_input.downcase == 'exit'
                options
                break
            end
            puts ""
            puts "Last step, let's write a review:"
            review_input = gets.chomp
            if review_input.downcase == 'exit'
                options
                break
            end
            Review.create(:review => review_input, :rating => rating_input, :user_id => user_name_id, :music_artist_id => band_name_id)
            options
            break
        end
    end

    def find_all_user_reviews
        while true
            space_helper(21)
            puts "Find all reviews by a User!"
            puts "Type exit at any time to quit..."
            puts ""
            puts "Enter the name of the User you'd like to find:"
            user_name_input = gets.chomp
            user_name_input = user_name_input.downcase
            if user_name_input.downcase == 'exit'
                options
                break
            end
            user_info(user_name_input)
            if @user == nil
                space_helper(22)
                puts "User not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                break
            else
                space_helper(20)
                review = Review.find_by(user_id: @user.id)
                if review != nil
                    puts "FOUND ALL REVIEWS BY USER: #{@user.name}, age: #{@user.age}, email: #{@user.email}"
                    space_helper(1)
                    all_reviews = Review.where(user_id: @user.id)
                    all_reviews.each_with_index do |r, index|
                        band_id = r.music_artist_id
                        band_name = MusicArtist.find_by(id: band_id)
                        space_helper(2)
                        puts "Rating of #{r.rating} out of 10"
                        puts "Review of #{band_name.name}:"
                        puts "#{r.review}"
                    end
                    space_helper(2)
                    puts "Press enter to return to main menu"
                    return_input = gets.chomp
                else
                    puts "FOUND THE USER: #{@user.name}, age: #{@user.age}, email: #{@user.email}"
                    space_helper(4)
                    puts "No reviews from this User :("
                    puts "Go back to the menu and create one!"
                    space_helper(4)
                    puts "Press enter to return to main menu"
                    return_input = gets.chomp
                end
            end
            options
            break
        end
    end

    def find_all_band_reviews
        while true
            space_helper(21)
            puts "Find Band reviews!"
            puts "Type exit at any time to quit..."
            puts ""
            puts "Enter the name of the Band you'd like to find:"
            band_name_input = gets.chomp
            band_name_input = band_name_input.downcase
            if band_name_input.downcase == 'exit'
                options
                break
            end
            band_info(band_name_input)
            if @band == nil
                space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            else
                space_helper(20)
                review = Review.find_by(music_artist_id: @band.id)
                if review != nil
                    puts "FOUND THE BAND: #{@band.name}"
                    all_reviews = Review.where(music_artist_id: @band.id)
                    all_reviews.each_with_index do |r, index|
                        user_id = r.user_id
                        user_name = User.find_by(id: user_id)
                        space_helper(2)
                        puts "Rating of #{r.rating}"
                        puts "Review by #{user_name.name}:"
                        puts "#{r.review}"
                    end
                    space_helper(4)
                    puts "Press enter to return to main menu"
                    return_input = gets.chomp
                else
                    puts "FOUND THE BAND: #{@band.name}"
                    space_helper(4)
                    puts "No reviews for this band :("
                    puts "Go back to the menu and create one!"
                    space_helper(4)
                    puts "Press enter to return to main menu"
                    return_input = gets.chomp
                end
            end
            options
            break
        end
    end

    def edit_review
        while true
            space_helper(21)
            puts "Edit a review"
            space_helper(4)
            puts "Type exit at any time to quit..."
            puts ""
            puts "First, enter your name:"
            user_name_input = gets.chomp
            user_name_input = user_name_input.downcase
            if user_name_input == 'exit'
                options
                break
            end
            puts ""
            puts "Next, type the name of the Band so we can edit that review:"
            band_name_input = gets.chomp
            band_name_input = band_name_input.downcase
            if band_name_input == 'exit'
                options
                break
            end
            user_info(user_name_input)
            band_info(band_name_input)
            if @user == nil
                space_helper(22)
                puts "User not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            end
            if @band == nil
                space_helper(22)
                puts "Band not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            else
                space_helper(20)
                review = Review.find_by(user_id: @user.id, music_artist_id: @band.id)
                if review != nil
                    puts "FOUND THE REVIEW: by #{@user.name}"
                    puts "Rating: #{review.rating}"
                    puts "#{review.review}"
                    space_helper(2)
                    puts "Are you sure you want to edit this review?"
                    puts "Type yes or no..."
                    edit_input = gets.chomp
                    edit_input = edit_input.downcase
                    if edit_input == 'exit'
                        options
                        break
                    end
                    if edit_input == 'no'
                        puts "Okay, returning you to the main menu..."
                        sleep 1.5
                        options
                        break
                    end
                    if edit_input == 'yes'
                        space_helper(2)
                        puts "Ok, enter a new review:"
                        new_review_input = gets.chomp
                        if new_review_input == 'exit'
                            options
                            break
                        end
                        review.review = new_review_input
                    end
                    space_helper(4)
                    puts "Review updated!"
                else
                    puts "Hmm... It doesn't seem like you've reviewed this band before..."
                    space_helper(2)
                    puts "Press enter to return to the main menu..."
                    return_input = gets.chomp
                end
            end
            options
            break
        end
    end

    def delete_review
        while true
            space_helper(21)
            puts "Delete a review"
            space_helper(4)
            puts "Type exit at any time to quit..."
            puts ""
            puts "First, enter your name:"
            user_name_input = gets.chomp
            user_name_input = user_name_input.downcase
            if user_name_input == 'exit'
                options
                break
            end
            puts ""
            puts "Next, type the name of the Band so we can delete that review:"
            band_name_input = gets.chomp
            band_name_input = band_name_input.downcase
            if band_name_input == 'exit'
                options
                break
            end
            user_info(user_name_input)
            band_info(band_name_input)
            if @user == nil
                space_helper(22)
                puts "User not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                break
            else
                space_helper(20)
                review = Review.find_by(user_id: @user.id, music_artist_id: @band.id)
                if review != nil
                    puts "FOUND THE REVIEW: by #{@user.name}"
                    puts "Rating: #{review.rating}"
                    puts "#{review.review}"
                    space_helper(2)
                    puts "Are you sure you want to delete this review?"
                    puts "Type yes or no..."
                    delete_input = gets.chomp
                    delete_input = delete_input.downcase
                    if delete_input == 'exit'
                        options
                        break
                    end
                    if delete_input == 'no'
                        space_helper(2)
                        puts "Ok, returning you back to the main menu..."
                        sleep 1.5
                        options
                        break
                    end
                    if delete_input == 'yes'
                        space_helper(2)
                        puts "Ok, deleting the review..."
                        sleep 2
                        review.destroy
                    end
                    space_helper(4)
                    puts "Review deleted!"
                    sleep 3
                end
            end
            options
            break
        end
    end

    def delete_user
        while true
            space_helper(22)
            puts "Delete a User"
            space_helper(4)
            puts "Type exit at any time to quit..."
            puts ""
            puts "First, enter your name:"
            user_name_input = gets.chomp
            user_name_input = user_name_input.downcase
            if user_name_input == 'exit'
                options
                break
            end
            user_info(user_name_input)
            if @user == nil
                space_helper(22)
                puts "User not found :("
                puts ""
                puts "Press enter to return to menu"
                fail_input = gets.chomp
                options
                break
            end
            space_helper(20)
            if @user != nil
                puts "FOUND THE USER: #{@user.name}, age: #{@user.age}, email: #{@user.email}"
                puts ""
                puts "Are you sure you want to delete your User and all associated reviews?"
                puts "Type yes or no..."
                delete_input = gets.chomp
                delete_input = delete_input.downcase
                if delete_input == 'exit'
                    options
                    break
                end
                if delete_input == 'no'
                    options
                    break
                end
                if delete_input == 'yes'
                    space_helper(2)
                    puts "Ok, deleting the User..."
                    sleep 2
                    all_reviews = Review.where(user_id: @user.id)
                    all_reviews.each_with_index do |r, index|
                        r.destroy
                    end
                    @user.destroy
                end
                space_helper(4)
                puts "User deleted!"
                sleep 3
            end
            options
            break
        end
    end
end