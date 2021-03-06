class DashboardController < ApplicationController

  before_action :authenticate_user!, except: [:search_results,:place_order, :select_time_slot,:cater_page,:cater_all,:search_small]
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
      if current_user.catering_company
    @all_food_items = current_user.catering_company.food_items
    @food_item = FoodItem.new
    # @food_item.food_item_add_ons.build
      else
        redirect_to :back, :notice => 'No Company is created yet'
      end

    
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
  	@orders = Order.all
  end



  def manage_orders
    @orders = current_user.catering_company.orders.order('created_at DESC')
  end


  def super_admin_manage_user
    @user = User.new
  	@users = User.where.not(:level => 1)
  end
  
  def manage_deals
    if current_user.catering_company
      @deals = current_user.catering_company.deals
      @deal = Deal.new
    end
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

  def manage_time_slots
    @time_slot = TimeSlot.new

  end


  def search_results

  begin
    date = params[:search][:date] || Date.current
    area = params[:search][:area]
    name = params[:search][:caterers]
    @price_min = params[:search][:price_min]
    @price_max = params[:search][:price_max]
    people_min = params[:search][:people_min]
    people_max = params[:search][:people_max]
=begin
   if people_max == "1"

     people_max = "10000"

   end
=end
    female_servers = params[:search][:female_servers]? true:false
    arabic = params[:search][:arabic_speaking]? true:false



    p params.inspect
    @companies =CateringCompany.where("sitting_capacity >= ? OR  sitting_capacity <= ?",people_min.to_i,
                                      people_max.to_i)

    if female_servers and arabic
    @companies = @companies.where(name: name,
                     :city => area,
                     female_servers: female_servers, arabic_speaking: arabic)
    elsif female_servers
    @companies = @companies.where(name: name,
                                  :city => area,
                                  female_servers: female_servers)
    elsif arabic
      @companies = @companies.where(name: name,
                                    :city => area,
                                   arabic_speaking: arabic)
    else
      @companies = @companies.where(name: name,
                                    :city => area)
    end




    #@companies

  rescue


  ensure
    @companies||= CateringCompany.all
  end
    if date
      cart = cookies.fetch(:cart, '{}')
      cart = JSON.parse(cart)
      cart["date"] = date
      cookies[:cart] = JSON.generate(cart)
    end

  end



  def place_order
    @comp = CateringCompany.find params[:id]
    cart = cookies.fetch(:cart, "{}")
    cart = JSON.parse(cart)
    first_time_slot = @comp.available_time_slots(cart["date"].to_date).first
    if first_time_slot


      cart["slot_id"] = cart.fetch("slot_id", first_time_slot.id )
      cookies[:cart] = JSON.generate(cart)  


    end

  end

   def cater_all
     @companies = CateringCompany.all

     cart = cookies.fetch(:cart, '{}')
     cart = JSON.parse(cart)
     cart["date"] ||= Date.current
     cookies[:cart] = JSON.generate(cart)
     @price_min = 0
     @price_max = 1

     render 'search_results'
   end



  def search_small
    name =  params[:search][:name]

    if name
      @companies = CateringCompany.where("lower(name) LIKE ?" , "%#{name.downcase}%")
    else
      @companies = CateringCompany.all
    end

    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    cart["date"] = Date.current
    cookies[:cart] = JSON.generate(cart)
    @price_min = 0
    @price_max = 1

    render 'search_results'

  end



  def add_item_to_cart
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    food_items = cart.fetch("food_items", [])
    food_items.append(  {item_id: params[:food_item_id], add_on_id: params[:add_on_id], quantity: 1}  )
    cart["food_items"] = food_items
    cookies[:cart] = JSON.generate(cart) 
    
    redirect_to :back
  end

  def add_deal_to_cart
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    deals = cart.fetch("deals", [])
    deals.append(  {item_id: params[:id], quantity: 1}  )
    cart["deals"] = deals
    cookies[:cart] = JSON.generate(cart)   
    
    redirect_to :back
  end


  def order_page
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    food_items = cart.fetch("food_items", [])
    food_item_id_list = food_items.collect {|key,value| key["item_id"]}



    deals = cart.fetch("deals", [])
    deals_id_list = deals.collect {|key,value| key["item_id"]}

    @food_items = food_item_id_list.collect {|f| FoodItem.find f} 
    @deals = deals_id_list.collect {|f| Deal.find f} 

  end

  def user_account_page
    @address = Address.new
  end

  def cater_page

    @review = Rating.new
    @comp = CateringCompany.find params[:id]
    begin
    all_ambience = @comp.ratings.pluck(:ambience)
    @ambience = all_ambience.sum / all_ambience.count

    all_food = @comp.ratings.pluck(:food)
    @food = all_food.sum/all_food.count

    all_service = @comp.ratings.pluck(:service)
    @service = all_service.sum/all_service.count

    all_value = @comp.ratings.pluck(:value)
    @value = all_value.sum/all_value.count

    @overall_rating =(@ambience + @food +@service + @value)/4

    total = @comp.ratings.count
    @five = (@comp.ratings.where(:ambience=> 5,:food=>5, :service=>5, :value=>5 ).count/total)*100
    @four =(@comp.ratings.where(:ambience=> 4,:food=>4, :service=>4, :value=>4 ).count/total)*100
    @three= (@comp.ratings.where(:ambience=> 3,:food=>3, :service=>3, :value=>3 ).count/total)*100
    @two = (@comp.ratings.where(:ambience=> 2,:food=>2, :service=>2, :value=>2 ).count/total)*100
    @one = (@comp.ratings.where(:ambience=> 1,:food=>1, :service=>1, :value=>1 ).count/total)*100
    rescue
      end
  end


  def select_time_slot
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    param_get =  params[:id]
    parsed = param_get.split("&")
    p "**********Got value is #{param_get}"
    p "**********Splited value is is #{parsed.inspect}"
  
    cart["slot_id"] = parsed[0]
    cart["slot_comp_id"] = parsed[1]
    cookies[:cart] = JSON.generate(cart) 

    redirect_to :back
  end



  def order_final_page
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    cart[:special_request] = params[:special_request]
    cookies[:cart] = JSON.generate(cart)
    food_items = cart.fetch("food_items", [])
    food_item_id_list = food_items.collect {|key,value| key["item_id"]}



    deals = cart.fetch("deals", [])
    deals_id_list = deals.collect {|key,value| key["item_id"]}

    @food_items = food_item_id_list.collect {|f| FoodItem.find f} 
    @deals = deals_id_list.collect {|f| Deal.find f} 
  end

  def place_order_final
    #create order here
    cart = cookies.fetch(:cart, '{}')
    cart = JSON.parse(cart)
    food_items = cart.fetch("food_items", [])
    deals = cart.fetch("deals", [])

    slot = TimeSlot.find_by_id( cart["slot_id"] )

    if not slot.nil? 
      a = Address.new order_params[:address]
      a.user = current_user
      continue = true
      if a.save
        o = Order.new( request_message: cart["special_request"], completed: false,
         user: current_user, catering_company: slot.catering_company, address: a)
      elsif order_params.has_key?(:selected_address)
        o = Order.new( request_message: cart["special_request"], completed: false,
         user: current_user, catering_company: slot.catering_company, address_id:order_params[:selected_address])
      else
        flash[:error] = "Please slect an address or fill the form below"

        # redirect not working properly
        #redirect_to :back
        continue = false
      end
      if continue
        o_item = OrderItem.new( order: o ) 

        food_items.each do |item|
          
          o_i_f = OderItemFood.create( order_item: o_item, food_item_id: item["item_id"].to_i, quanitiy: item["quantity"].to_i )
          if item["add_on_id"]
            OrderFoodItemAddOn.create(oder_item_food_id:item["item_id"].to_i , food_item_add_on_id: item["add_on_id"].to_i)
          end 
        end

        deals.each do |item|
          o_i_f = OderItemDeal.create( order_item: o_item, deal_id: item["item_id"].to_i, quanitiy: item["quantity"].to_i )
        end

    
        o_item.save

        cart = cookies.fetch(:cart, '{}')
        cart = JSON.parse(cart)
        date = cart[:date]

        inavail = Inavailability.create(time_slot: slot, catering_company: slot.catering_company, date: date||Date.current)
            
          o.inavailability_id = inavail.id
           o.save
       
        cookies[:cart] = "{}"
        flash[:success] = "Order has been created succesfully"
        
      end
    else
      flash[:error] = "please select available slot"  
    end
    
    redirect_to root_path
    
  end

  def complete_order
    order = Order.find params[:id]
    if current_user.catering_company == order.catering_company
      order.completed = true
      order.save
    end
    flash[:notice] = "Order #{order.id} has been delivered"
    redirect_to :back
  end

  private 
    def order_params
      params.permit(:selected_address, address: [:full_name, :email, :mobile_number1, :mobile_number2, :street_address, :street_address_opt, :city])
    end

=begin
    def search_params
      params.require(:search).permit(:date, :area, :caterers, :price_min, :price_max, :female_servers, :arabic_speaking)
    end
=end


end
