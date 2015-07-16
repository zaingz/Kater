class HomeController < ApplicationController
  before_filter :login_required, :except => [:index]
	before_action :authorize_as_admin, :only => [:dashboard]

  def index
		if current_user
		if current_user.level==1
			redirect_to :action => 'dashboard'
		end
		end
  end

  def create_new_user
		# render "devise/registrations/new"
	end

	def save_new_user
		   @resource = User.new(user_params)
		   if @resource.save
					     redirect_to action: 'dashboard'
			 else
							render :create_new_user
			 end

		 end


  def edit_user
  	@resource = User.find(params[:id])
  	render "devise/registrations/edit"
  end

	def dashboard
		if current_user.level == 1
			@users = User.where(:level => 2)
			@companies = CateringCompany.all
			render 'dashboard_super'
		elsif current_user.level == 2

			render 'dashboard_shop_keeper'

		end
	end

private



	  def user_params
			params.require(:user).permit(:first_name, :last_name,  :mobile_number1,
																	:email, :birthdate, :gender,:level, :occupation, :password, :password_confirmation )
		end


end
