class HomeController < ApplicationController
  before_filter :login_required, :except => [:index]

  def index
  	if user_signed_in?
	  	if current_user.level == 1
	  		@users = User.all
	  		render 'dashboard_super'
	  	elsif current_user.level == 2
	  	 	render 'dashboard_shop_keeper'
	  	elsif current_user.level == 3
	  		render 'dashboard_regular'
	  	end
    else
      render 'index'
	  end
  end

  def save_new_user
    @resource = User.new(user_params)
    if @resource.save
      redirect_to root_path
    else
      render :create_new_user 
    end
    
  end

  def create_new_user
  	# render "devise/registrations/new"
  end

  def edit_user
  	@resource = User.find(params[:id])
  	render "devise/registrations/edit"
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name,  :mobile_number1, :email, :birthdate, :gender,:level, :occupation, :password, :password_confirmation )
  end
  
end
