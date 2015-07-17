class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_as_super_admin, only: [:super_admin]

  def super_admin

  	@users = User.all
  	@c_company = CateringCompany.all

  end

  def manager_admin
  end


  def super_admin_manage_user

  end


end
