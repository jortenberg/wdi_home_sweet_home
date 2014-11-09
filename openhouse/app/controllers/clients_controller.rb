class ClientsController < ApplicationController

	def new
		redirect_to '/houses'
	end


	def index
		user = User.find_by(id: session[:user_id])
		the_houses = user.houses
		the_clients = user.clients
		
		render(:index, { locals: { the_houses: the_houses, the_clients: the_clients } })
	end


 
	def create
		if params["are_you"].downcase == "yes"
			answer = true
		else
			answer = false
		end

		client = Client.new(fname: params["fname"], lname: params["lname"], email: params["email"], phone: params["phone"], st_address: params["st_address"], city: params["city"], state: params["state"], zip: params["zip"], are_you: answer, house_id: params["house_id"])

		if client.valid? 
			client.save
			redirect_to '/houses/' + params["house_id"]
		else
			render :json => client.errors.messages
		end
	end


	def show
		client = Client.find(params[:id])
		
		render(:show, { locals: { client: client } })
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

		respond_to do |format|
			format.json do
				if house.valid?
					house.save
					render :json => house
				else
					render :json => house.errors.messages.to_json
				end
			end
		end
	end

	def destroy
		house = House.find(params[:id])
		house.destroy

		# render :json => house
	end
  
end