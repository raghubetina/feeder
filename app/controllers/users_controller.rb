class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to users_show_url(@user), :notice => "Thank you for signing up."
    else
      redirect_to users_new_url, :notice => "There was an error processing your request. Please check your email and password confirmation."
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    
  end
  
  def destroy
    
  end
end
