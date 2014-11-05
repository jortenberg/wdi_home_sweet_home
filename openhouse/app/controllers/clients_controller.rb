class ClientsController < ApplicationController

	def new
		redirect_to '/houses'
	end


	#HTTParty.get('http://localhost:3000/houses.json')
	def index
		# find clients that have a particular house_id
		
		house = House.find(params["house_id"])

		clients = house.clients

		respond_to do |format|
			format.json { render :json => clients }
		end
	end

	#Good input
# HTTParty.post('http://localhost:3000/clients.json', :body => {fname: "Frank", lname: "Giampolo", email: "14 Pine Street", phone: "512-546-3456", st_address: "14 Pinster Street", state: "NY", zip: 11340, are_you: true, house_id: 5})
 
	def create

		# binding.pry
		client = Client.new(fname: params["fname"], lname: params["lname"], email: params["email"], phone: params["phone"], st_address: params["st_address"], city: params["city"], state: params["state"], zip: params["zip"], are_you: false, house_id: params["house_id"])

		if client.valid? 
			client.save
			redirect_to '/houses'
		else
			render :json => client.errors.messages
		end

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