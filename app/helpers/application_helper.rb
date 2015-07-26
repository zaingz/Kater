module ApplicationHelper
	
	def get_cart_food_items
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

	    #food_items.collect {|key,value| key["a"]}

	end

	def get_food_item_add_ons item_id
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

		list_ids = food_items.collect {|k,v| k["add_on_id"] if k["item_id"]==item_id }	    

		FoodItemAddOn.find list_ids
	    #food_items.collect {|key,value| key["a"]}

	end

	def get_cart_deals
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    deals = cart.fetch("deals", []) 

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
end
