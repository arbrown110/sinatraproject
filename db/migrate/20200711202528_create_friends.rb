class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.datetime :date
      t.integer :score
      t.text :location
      t.integer :number
      t.text :interest
      t.integer :friend_id
    end  
  end
end
