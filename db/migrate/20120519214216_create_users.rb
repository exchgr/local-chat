class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :chatroom_id
      t.integer :radius

      t.timestamps
    end
  end
end
