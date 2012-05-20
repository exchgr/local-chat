class User < ActiveRecord::Base
  attr_accessible :chatroom_id, :lat, :long, :name
  
  belongs_to :chatroom
  has_many :messages
  
end
