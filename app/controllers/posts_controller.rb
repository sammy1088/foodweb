class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  def index
 
    if params[:search].present?
    
        @posts = Post.near(params[:search], 50, order: 'distance').paginate(:page => params[:page], :per_page => 9)

  end
  	else
         if params[:search].blank?
           result = request.location
           @posts = Post.near([result.latitude, result.longitude], 50, order: 'distance').paginate(:page => params[:page], :per_page => 9)
         end
   
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
  marker.lat post.latitude
  marker.lng post.longitude
      marker.infowindow post.address
      marker.picture({"url" => view_context.image_path(post.image.url(:small)), 
    "width" => 64, 
    "height" => 64,
        })
    end

  end
 
  def new
  end
  def show
    @post = Post.find(params[:id])
  end
 def create
  @post = Post.new(post_params)
    @post.username = current_user.username
@post.user_id = current_user.id
  @post.save
  redirect_to @post
end
    def edit

    @post = Post.find(params[:id])
end
def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save 
      redirect_to @post
    else
      render 'edit'
    end
end
end
 
private
  def post_params
    params.require(:post).permit(:title, :username, :text, :address, :latitude, :longitude, :image, :price, :quantity)
  end

