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
      redirect_to user_url(@user), :notice => "Thank you for signing up."
    else
      redirect_to new_user_url, :notice => "There was an error processing your request. Please check your email and password confirmation."
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_url(@user), :notice => "Changes saved."
    else
      redirect_to edit_user_url(@user), :notice => "There was an error processing your request. Changes not saved."
    end
  end
  
  def destroy
    
  end
end
