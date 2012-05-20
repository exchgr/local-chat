class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :sessionExist

  def sessionExist
	  if session[:user_id].nil?
		  redirect_to new_user_path
	  end
  end
end
