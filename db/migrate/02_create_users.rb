class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |u|
            u.string :name
            u.integer :age
            u.string :email
        end
    end
end