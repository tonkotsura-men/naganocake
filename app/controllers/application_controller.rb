class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resouce)
		customers_path
	end

end