class UsersController < ApplicationController

  def new
    render(:new)
  end

  def index
    users = User.all

    render :json => users 
  end

  def create
    user = User.new(fname: params[:fname], lname: params[:lname], email: params[:email], password: params[:password])

    if user.valid? 
      user.save
      redirect_to '/login'
    else
      render :json => user.errors.messages
    end
  end

  def show
    user = User.find(params[:id])

    render :json =>user

  end

  def update
    user = User.find(params[:id])
    user.fname = params["fname"]
    user.lname = params["lname"]
    user.email = params["email"]
    user.password = params["password"]

    if user.valid?
      user.update
      redirect_to '/login'
    else
      render :json => user.errors.messages
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => user
  end
end