class UsersController < ApplicationController
  http_basic_authenticate_with name: "sammy1088", password: "Ce66$rio", except: [:show]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  
  
  end