class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reject_locked!, if: :devise_controller?
before_action :set_variant


  # Devise permitted params
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :username,
      :email,
      :password,
      :password_confirmation,
        :phone,
      :image,
      :bio,
      :categ,
      :address)
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :username,
      :email,
      :phone,
      :password,
      :password_confirmation,
      :current_password,
      :image,
      :bio,
      :categ,
      :address
      )
    }
  end

  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    inside_path
  end

  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      user_session = nil
      current_user = nil
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!

  # Only permits admin users
  def require_admin!
    authenticate_user!

    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!
  
  private
     def set_variant
       case request.user_agent
      when /iPhone/i
        request.variant = :phone
      when /Android/i && /mobile/i
        request.variant = :phone
      when /Windows Phone/i
        request.variant = :phone
      end
    end


end
