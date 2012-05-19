class Chatroom < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :roomnumber

  has_many :users
  has_many :messages, :through => :users

end
