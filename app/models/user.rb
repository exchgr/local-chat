class User < ActiveRecord::Base
  attr_accessible :chatroom_id, :lat, :long, :name, :radius

  belongs_to :chatroom
  has_many :messages
end
