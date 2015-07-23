module ApplicationHelper
	def get_cart_food_items
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    food_items = cart.fetch("food_items", []) 

	    #food_items.collect {|key,value| key["a"]}

	end

	def get_cart_deals
	    cart = cookies.fetch(:cart, '{}')
	    cart = JSON.parse(cart)
	    deals = cart.fetch("deals", []) 

	end

	# can be security issue
	# def get_cart_total_price
	# 	cart = cookies.fetch(:cart, '{}')
	#     cart = JSON.parse(cart)
	# 	cart.fetch('total', 0)
	# end
end
