class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_as_super_admin, only: [:super_admin]

  def super_admin

  	@users =User.where.not(:level => 1)
  	@c_company = CateringCompany.all

  end



  def create_company
    if current_user.catering_company
      @catering_company = current_user.catering_company
    else
      @catering_company = CateringCompany.new
    end
  end
  
  def create_food_item
    @all_food_items = current_user.catering_company.food_items
    @food_item = FoodItem.new
    
  end
  
  

  def destroy_user
  	if current_user.level == 1
  		User.find(params[:id]).destroy
  	end
  	redirect_to action: "super_admin_manage_user"
  end
  
  def delete_food_item
    if current_user.level == 2
      FoodItem.find(params[:id]).destroy
    end
    redirect_to action: "create_food_item"
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

  def super_admin_manage_orders
  	# here we will fetch all orders
  end

  def super_admin_manage_user
    @user = User.new
  	@users = User.where.not(:level => 1)
  end
  
  def manage_deals
    @deals = current_user.catering_company.deals
    @deal = Deal.new
  end
  
  def delete_deal
    if current_user.level == 2
      Deal.find(params[:id]).destroy
    end
    redirect_to action: "manage_deals"
  end
  
  def manage_addons
    # @all_food_items_addons = current_user.catering_company.food_item_addons
    @food_item_addons = FoodItem.new
  end

  # def user_id
  # 	params.permit(:id)
  # end

end
