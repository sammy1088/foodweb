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
    if post.user.categ == "Restaurant"
      marker.picture({
        :url => "http://www.google.com/mapfiles/ms/micons/restaurant.png",
                  :width   => 60,
                  :height  => 60
          }) 
    end
    if post.user.categ == "Buyer"
      marker.picture({
                  :url => "http://www.google.com/mapfiles//ms/micons/shopping.png",
                  :width   => 60,
                  :height  => 60
          }) 
    end
    if post.user.categ == "Grocery Store"
      marker.picture({
        :url => "http://www.google.com/mapfiles//ms/micons/grocerystore.png",
                  :width   => 60,
                  :height  => 60
          }) 
    end
    if post.user.categ == "Seller"
      marker.picture({
        :url => "http://www.google.com/mapfiles//ms/micons/homegardenbusiness.png",
                  :width   => 60,
                  :height  => 60
          }) 
    end
    marker.infowindow render_to_string(:partial => "mapbox", locals: { post: post })
     
    end

  end

  def inside
 
  end
  def disclaimer
  end
  
  
end
