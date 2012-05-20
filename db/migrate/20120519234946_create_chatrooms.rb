class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.integer :number
      t.float :lat
      t.float :long
      t.string :name
      t.timestamps
    end
  end
end
