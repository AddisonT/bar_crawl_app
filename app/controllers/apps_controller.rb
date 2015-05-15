class AppsController < ApplicationController
	#controller for adding user's name to the profile tab in 
	#nav bar
	def contact
		@user = current_user
	end

	def test
		@user = current_user
	end
end
