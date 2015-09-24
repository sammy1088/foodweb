class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
@user = User.find(params[:id])
    @posts = @user.posts
end
  def edit
    @user = User.find(params[:id])
  end
  def update
  
   old_username = @user.username
    new_params = user_params.dup
    new_params[:username] = new_params[:username].strip
    new_params[:email] = new_params[:email].strip
    new_params[:phone] = new_params[:phone].strip

    @user.username = new_params[:username]
    @user.email = new_params[:email]
    @user.phone = new_params[:phone]
    @user.image = new_params[:image]
    @user.password = new_params[:password] if new_params[:password].strip.length > 0
    @user.password_confirmation = new_params[:password_confirmation] if new_params[:password_confirmation].strip.length > 0


    if @user.valid?
      @user.skip_reconfirmation!
      @user.save
      redirect_to admin_users_path, notice: "#{@user.username} updated."
    else
      flash[:alert] = "#{old_username} couldn't be updated."
      render :edit
    end
  end
  def set_user
    @user = User.friendly.find(params[:id])
  rescue
    flash[:alert] = "The user with an id of #{params[:id]} doesn't exist."
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(
    :username,
    :email,
    :password,
    :password_confirmation,
    :admin,
    :locked,
    :phone,
      :image
    )
  end
  end