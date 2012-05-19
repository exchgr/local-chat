class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :chatroom_id
      t.float :lat
      t.float :long
      t.integer :radius

      t.timestamps
    end
  end
end
