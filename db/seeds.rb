# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
# reg_user45 = User.create(:email => 'req@kater.com', :password => '12345678', :password_confirmation =>'12345678',
#            :level => 3, :birthdate => Date.today, :first_name=> 'Ali',  :last_name => 'bhagwan' )
#
 reg_userx = User.create(:email => 'user@kater.com', :password => '12345678', :password_confirmation =>'12345678',
                        :level => 3, :birthdate => Date.today, :first_name=> 'Test',  :last_name => 'User' )
#
#
#
# reg_user22 = User.create(:email => 'boser@kater.com', :password => '12345678', :password_confirmation =>'12345678',
#                        :level => 3, :birthdate => Date.today, :first_name=> 'Ahsan',  :last_name => 'Ali' )
#
# reg_user2 = User.create(:email => 'boser2@kater.com', :password => '12345678', :password_confirmation =>'12345678',
#                        :level => 2, :birthdate => Date.today, :first_name=> 'Ahsan',  :last_name => 'Ali' )
#
#
 shopKeeper_user = User.create(:email => 'shopkeeper@kater.com', :password => '12345678', :password_confirmation =>'12345678',
                       :level => 2, :birthdate => Date.today, :first_name=> 'Test',  :last_name => 'User2' )
#
 admin_user = User.create(:email => 'admin@kater.com', :password => '12345678', :password_confirmation =>'12345678',
                       :level => 1, :birthdate => Date.today)
#
# com = CateringCompany.create(:name=> Faker::Company.name, :description=> Faker::Lorem.paragraph,  :number_of_employes => 5,  :contact_number => Faker::PhoneNumber.cell_phone,
#                              :address=> Faker::Address.street_address, :city=> Faker::Address.city, :state=> Faker::Address.state, :country=> Faker::Address.country,
#                              :user => shopKeeper_user)
#
# t = TimeSlot.create(:tittle => 'Morning Shift', :start_time =>2.days.ago,
#                     :end_time => 1.day.ago, :catering_company=>com)
#
# com2 = CateringCompany.create(:name=> Faker::Company.name, :description=> Faker::Lorem.paragraph,  :number_of_employes => 5,  :contact_number => Faker::PhoneNumber.cell_phone,
#                               :address=> Faker::Address.street_address, :city=> Faker::Address.city, :state=> Faker::Address.state, :country=> Faker::Address.country,
#                               :user => shopKeeper_user)
#
# food = FoodItem.create(:name=>'Burger', :description=> Faker::Lorem.paragraph, :price=>100, :catering_company => com)
#
#
#
# food2 = FoodItem.create(:name=>'Piza', :description=> Faker::Lorem.paragraph, :price=>200, :catering_company => com)
# food3 = FoodItem.create(:name=>'Chess', :description=> Faker::Lorem.paragraph, :price=>200, :catering_company => com)
# food4 = FoodItem.create(:name=>'Shake', :description=> Faker::Lorem.paragraph, :price=>500, :catering_company => com)
#
# addon = FoodItemAddOn.create(:name=> 'Extra chess', :price=>5, :food_item=>food)
#
# addon1 = FoodItemAddOn.create(:name=> 'Extra mayo', :price=>5, :food_item=>food)
# addon2 = FoodItemAddOn.create(:name=> 'Extra chess', :price=>5, :food_item=>food2)
#
#
# foodz2 = FoodItem.create(:name=>'Mozeralla', :description=> Faker::Lorem.paragraph, :price=>200, :catering_company => com)
# foodz3 = FoodItem.create(:name=>'Sandwich', :description=> Faker::Lorem.paragraph, :price=>200, :catering_company => com)
# foodz4 = FoodItem.create(:name=>'Pakoras', :description=> Faker::Lorem.paragraph, :price=>500, :catering_company => com)
#
#
#
# r = Rating.create(ambience: 5, food: 4, service:5, value:3, :tittle=> 'This company was the best and goodest of all', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_userx,:catering_company=> com)
# r = Rating.create(ambience: 5, food: 4, service:5, value:3, :tittle=> 'This company was ok', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_userx,:catering_company=> com)
# r = Rating.create(ambience: 5, food: 1, service:5, value:3, :tittle=> 'This company was the best and goodest of all', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_userx, :catering_company=> com)
#
#
#
#
# r = Rating.create(ambience: 5, food: 4, service:5, value:3, :tittle=> 'This company was the best and goodest of all', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_userx, :catering_company=> com)
# r = Rating.create(ambience: 5, food: 4, service:5, value:3, :tittle=> 'This company was ok', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_userx,:catering_company=> com)
# r = Rating.create(ambience: 5, food: 1, service:5, value:3, :tittle=> 'This company was the best and goodest of all', :description=> Faker::Lorem.paragraph,
#                   :user=> reg_user45,:catering_company=> com)
#
# deal1= Deal.create(:name=>'Jumbo Deal', :description=> Faker::Lorem.paragraph, :price=>500, :catering_company => com)
# deal2= Deal.create(:name=>'Mega Deal', :description=> Faker::Lorem.paragraph, :price=>200, :catering_company => com)
#
