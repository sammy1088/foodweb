class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def index
   
  end
  def home
    
    @posts = Post.near([35.2200, 97.4400], 50000, order: 'distance')
  
 @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
  marker.lat post.latitude
  marker.lng post.longitude

    marker.infowindow render_to_string(:partial => "mapbox", locals: { post: post })
     
    end

  end

  def inside
 
  end
  def disclaimer
  end
  
  
end
