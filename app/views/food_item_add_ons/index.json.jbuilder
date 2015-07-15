json.array!(@food_item_add_ons) do |food_item_add_on|
  json.extract! food_item_add_on, :id
  json.url food_item_add_on_url(food_item_add_on, format: :json)
end
