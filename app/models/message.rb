class Message < ActiveRecord::Base
  attr_accessible :chatroom_id, :message, :user_id
end
