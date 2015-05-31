class PostsController < ApplicationController
  def index
    if params[:search].present?
      @posts = Post.near(params[:search], 500, order: 'distance')
  	else
    @posts = Post.all
  	end
  end
 
  def new
  end
  def show
    @post = Post.find(params[:id])
  end
 def create
  @post = Post.new(post_params)
 
  @post.save
  redirect_to @post
end
 
private
  def post_params
    params.require(:post).permit(:title, :text, :address, :latitude, :longitude)
  end
end
