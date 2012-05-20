class Chatroom < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :radius
  
  has_many :users
  has_many :messages
  
  def self.findChatrooms(lat, long)
  	  #for each chatroom
  	  #if the distance between the chatroom and the user is less than the radius of the chatroom
  	  #then add it to the the array
  	  
  	  chatrooms = []
  	  Chatroom.all.each do |chatroom|
  	  	  if !chatroom.nil?
			  a = chatroom.lat - lat
			  b = chatroom.long - long
  	  	  
			  if chatroom.radius <= Math.sqrt(a**2 + b**2)
				  chatrooms << chatroom
			  end
		  end
  	  end
  end
  
  
  def findDistance(lat1, long1, lat2, long2)
  	  a = lat1 - lat2
  	  b = long1 - long2
  	  Math.sqrt(a**2 + b**2)
  end
  	  
end
