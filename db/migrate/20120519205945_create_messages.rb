class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :user_id
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
