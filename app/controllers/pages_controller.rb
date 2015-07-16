class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def index
   
  end
  def home
    @posts = Post.all
@hash = Gmaps4rails.build_markers(@posts) do |post, marker|
  marker.lat post.latitude
  marker.lng post.longitude
end
  end

  def inside
 
  end
  
  
end
