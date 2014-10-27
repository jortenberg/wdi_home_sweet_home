class MainController < ApplicationController

	def index
		@user = User.find_by(id: session[:user_id])

		if @user
			render :main
		else
			redirect_to '/login'
		end
	end
  
end