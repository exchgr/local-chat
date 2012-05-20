class Chatroom < ActiveRecord::Base
  attr_accessible :lat, :long, :name
  
  has_many :users
  has_many :messages
  
end
