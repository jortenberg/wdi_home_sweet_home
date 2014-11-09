class HousesController < ApplicationController

	def new
		@user = User.find_by(id: session[:user_id])

		if @user
			render(:new)

		else
			redirect_to '/login'
		end
	end

	def reschedule
		@user = User.find_by(id: session[:user_id])

		if @user
			house = House.find(params[:id])
			render(:reschedule, { locals: { house: house } })
		else
			redirect_to '/login'
		end

	end
		

	def index
		@user = User.find_by(id: session[:user_id])

		if @user
			houses = @user.houses
			render(:index, { locals: { houses: houses } })

		else
			redirect_to '/login'
		end
	end

 
	def create
		house = House.new(sch_date: params["sch_date"], sch_time: params["sch_time"], st_address: params["st_address"], city: params["city"], state: params["state"], zip: params["zip"], user_id: params["user_id"])

		if house.valid? 
			house.save
			redirect_to '/houses'
		else
			render :json => house.errors.messages
		end
	end


	def show
		house = House.find_by(id: params[:id])
		render(:show, { locals: { house: house } })
	end

 
	def update
		house = House.find(params[:id])
		house.sch_date = params["sch_date"]
		house.sch_time = params["sch_time"]
		house.st_address = params["st_address"]
		house.city = params["city"]
		house.state = params["state"]
		house.zip = params["zip"]
		house.user_id = params["user_id"]

		if house.valid?
			house.save
			redirect_to '/houses'
		else
			render :json => house.errors.messages
		end
	end


	def destroy
		house = House.find(params[:id])
		house.destroy

		redirect_to '/houses'
	end
  
end