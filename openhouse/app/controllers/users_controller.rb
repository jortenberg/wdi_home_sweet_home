class UsersController < ApplicationController

  def new
    render(:new)
  end

  def index
    users = User.all
    
    respond_to do |format|
      format.json { render :json => users }
    end
  end

    #Good input
  #HTTParty.post('http://localhost:3000/house.json', :body => {sch_date: 11/2/2014, sch_time: 1:00pm, st_address: "14 Pine Street", city: "Oceanside", state: "NY", zip: 11340, user_id: 4})
  #Bad input
  #HTTParty.post('http://localhost:3000/house.json', :body => {sch_date: 11/2/2014}) 

  def create
    user = User.new(fname: params[:fname], lname: params[:lname], email: params[:email], password: params[:password])

    respond_to do |format|
      format.json do
        if user.valid? 
          user.save
          redirect_to '/login'
        else
          render :json => user.errors.messages.to_json
        end
      end
    end

    # redirect_to '/login'
    ### AUTOMATICALLY assumes render(:create)
  end

  def show
    user = User.find(params[:id])

    respond_to do |format|
      format.json { render :json => user }
    end
  end

  def update
    user = User.find(params[:id])
    user.fname = params["fname"]
    user.lname = params["lname"]
    user.email = params["email"]
    user.password = params["password"]

    respond_to do |format|
      format.json do
        if user.valid?
          user.update
          redirect_to '/login'
        else
          render :json => user.errors.messages.to_json
        end
      end
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy

    render :json => user
  end
end