class Chatroom < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :roomnumber
end
