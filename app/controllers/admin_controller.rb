class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"
  def index
    @posts = Post.all
    @users = User.all
  end
  
end