class AppsController < ApplicationController
	def contact
		@user = current_user
	end
end
