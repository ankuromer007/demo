class ApplicationController < ActionController::Base
  protect_from_forgery

  def stored_location_for(resource)
  	nil
	end

  def after_sign_in_path_for(resource)
  		dashboard_index_path
	end
end
