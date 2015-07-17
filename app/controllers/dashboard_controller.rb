class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_as_super_admin, only: [:super_admin]

  def super_admin

  	@users =User.where.not(:level => 1)
  	@c_company = CateringCompany.all

  end

  def manager_admin
  end

  def destroy_user
  	if current_user.level == 1
  		User.find(params[:id]).destroy
  	end
  	redirect_to action: "super_admin_manage_user"
  end

  def destroy_comp
  	if current_user.level == 1
  		CateringCompany.find(params[:id]).destroy
  	end
  	redirect_to action: "super_admin_manage_company"
  end

  def super_admin_manage_company
  	@c_company = CateringCompany.all
  end

  def super_admin_manage_user
  	@users = User.where.not(:level => 1)
  end

  # def user_id
  # 	params.permit(:id)
  # end

end
