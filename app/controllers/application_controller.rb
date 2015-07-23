class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def login_required
    redirect_to('/') if current_user.blank?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :mobile_number1, :mobile_number2,
                                               :birthdate, :occupation, :gender, :level]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :mobile_number1, :mobile_number2,
                                                      :birthdate, :occupation, :gender]
  end

  def authorize_as_super_admin
    if current_user
      if current_user.level==1
        flash[:notice]= 'Welcome to admin panael'
      else
        flash[:notice]= 'You have no access'
        redirect_to root_path
      end
    end
  end

  def authorize_as_shop_admin
    if current_user
       if current_user.level==2
          flash[:notice]= 'Welcome'
       else
         flash[:notice]= 'You are not shoop keeper'
          redirect_to root_path
       end
    end
  end

  def authorize_as_admin
    if current_user and (current_user.level==2 || current_user.level==1)
        flash[:notice]= 'Welcome'
    else
      flash[:notice]= 'You dont have a dashboard'
      redirect_to :controller => 'home', :action => 'index'
    end
  end

  def authorize_as_regular_user
    if !current_user and current_user.level!=3
      flash[:alert]= 'You are not regular user'
      redirect_to root_path
    end
  end

  

  # def after_sign_in_path_for(resource)
  #   current_user_path
  # end

end
