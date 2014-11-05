class HousesController < ApplicationController

	def new
		@user = User.find_by(id: session[:user_id])

		if @user
			render(:new)

		else
			redirect_to '/login'
		end

	end
		
	def index
		# this is where my route goes to after session cookies are assign
		user = User.find_by(id: session[:user_id])
		houses = user.houses

		render(:index, { locals: { user: user, houses: houses } })
	end

	#Good input
	# HTTParty.post('http://localhost:3000/houses.json', :body => {sch_date: "11/2/2014", sch_time: "1:00pm", st_address: "14 Pine Street", city: "Oceanside", state: "NY", zip: 11340, user_id: 5})
 
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