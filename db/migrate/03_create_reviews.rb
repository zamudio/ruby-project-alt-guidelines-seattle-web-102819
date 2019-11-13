class CreateReviews < ActiveRecord::Migration[5.2]
    def change
        create_table :reviews do |u|
            u.string :review
            u.integer :rating
            u.integer :user_id
            u.integer :artist_id
        end
    end
end