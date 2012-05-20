class Message < ActiveRecord::Base
  attr_accessible :chatroom_id, :message, :user_id

  belongs_to :user
  belongs_to :chatroom
  
end
