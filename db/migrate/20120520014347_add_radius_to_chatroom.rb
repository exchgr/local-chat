class AddRadiusToChatroom < ActiveRecord::Migration
  def change
    add_column :chatrooms, :radius, :integer
  end
end
