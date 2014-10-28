class ClientsController < ApplicationController

	#HTTParty.get('http://localhost:3000/houses.json')
	def index
		clients = Client.all

		respond_to do |format|
			format.json { render :json => clients }
		end
	end

	#Good input
	# HTTParty.post('http://localhost:3000/houses.json', :body => {sch_date: "11/2/2014", sch_time: "1:00pm", st_address: "14 Pine Street", city: "Oceanside", state: "NY", zip: 11340, user_id: 5})
	#Bad input
	#HTTParty.post('http://localhost:3000/houses.json', :body => {sch_date: 11/2/2014})  
	def create
		client = Client.new(fname: params["fname"], lname: params["lname"], email: params["email"], phone: params["phone"], st_address: params["st_address"], state: params["state"], zip: params["zip"], are_you: params["are_you"]), house_id: params["house_id"])

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

		render :json => house
	end
  
end