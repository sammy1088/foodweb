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
    marker.infowindow render_to_string(:partial => "mapbox", locals: { post: post })
     
    end
respond_to do |format|
  format.html do |html|
    html.phone 
  end
end
  end

  def inside
 
  end
  def disclaimer
  end
  
  
end
