class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :sessionExist
  before_filter :removeUserChatroom

  def sessionExist
	  if session[:user_id].nil?
		  redirect_to new_user_path
	  end
  end
  
  def removeUserChatroom
  	  if session[:user_id]
  	  	  @user = User.find(session[:user_id])	  
  	  	  if !@user.nil?
  	  	  	  @user.chatroom_id = nil
  	  	  	  @user.save
  	  	  end
  	  end
  	  
  end
  
end
