module ApplicationHelper

	def bootstrap_class_for flash_type
	    case flash_type
	      when "success"
	        "alert-success"
	      when "error"
	        "alert-danger"
	      when "alert"
	        "alert-block"
	      when "notice"
	        "alert-info"
	      else
	        flash_type.to_s
	    end
	end
	
	def get_cart_food_items
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

	    #food_items.collect {|key,value| key["a"]}
	    ids = (food_items.collect {|key,value| key["item_id"]}).compact
	    if not ids.empty?
			FoodItem.find ids
			food_items
		else
			[]
		end
		rescue ActiveRecord::RecordNotFound
			[]
	end

	def get_cart_food_items_record
		cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

	    ids = (food_items.collect {|key,value| key["item_id"]}).compact
	    if not ids.empty?
			FoodItem.find ids
		else
			[]
		end
		rescue ActiveRecord::RecordNotFound
			[]
	end

	def get_food_item_add_ons item_id
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

		list_ids = food_items.collect {|k,v| k["add_on_id"] if k["item_id"]==item_id }	    

		if not (list_ids.compact).empty?
			FoodItemAddOn.find list_ids
		end
	    #food_items.collect {|key,value| key["a"]}

	end

  def get_date
		cart = cookies.fetch(:cart, '{}')
		cart = JSON.parse(cart)


		cart["date"].to_date || Date.current
	end

	# key can be food_items or deals
	def get_food_item_quanity key, item_id, index
		cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    if cart[key][index]["item_id"] == item_id
	    	cart[key][index]["quantity"]
	    end
	end

	def get_cart_deals
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    deals = cart.fetch("deals", []) 
	    ids = (deals.collect {|key,value| key["item_id"]}).compact
	    
	    if not ids.empty?
			Deal.find ids
			deals
		else
			[]			
		end

		rescue ActiveRecord::RecordNotFound
			[]

	end

	def get_cart_deals_record
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    deals = cart.fetch("deals", [])

	    ids = (deals.collect {|key,value| key["item_id"]}).compact
	    
	    if not ids.empty?
			Deal.find ids
		else
			[]			
		end

		rescue ActiveRecord::RecordNotFound
			[]

	end

	def get_selected_time_slots
		
		cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    slot_id = cart.fetch("slot_id", nil) 
	    TimeSlot.find slot_id
		rescue ActiveRecord::RecordNotFound
			nil
	end

	# can be security issue
	# def get_cart_total_price
	# 	cart = cookies.fetch(:cart, '{}')
	#     cart = JSON.parse(cart)
	# 	cart.fetch('total', 0)
	# end

  def overall_rating comp
		all_ambience = comp.ratings.pluck(:ambience)

		begin
		ambience = all_ambience.sum / all_ambience.count

		all_food = comp.ratings.pluck(:food)
		food = all_food.sum/all_food.count

		all_service = comp.ratings.pluck(:service)
		service = all_service.sum/all_service.count

		all_value = comp.ratings.pluck(:value)
		value = all_value.sum/all_value.count

		 overall_rating =(ambience + food +service + value)/4
		rescue
			overall_rating =0
		ensure
			return overall_rating
		end
		end

end