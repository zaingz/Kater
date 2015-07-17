# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


reg_user = User.create(:email => 'req@kater.com', :password => '12345678', :password_confirmation =>'12345678',
           :level => 3, :birthdate => Date.today )

shopKeeper_user = User.create(:email => 'shoopkeeper@kater.com', :password => '12345678', :password_confirmation =>'12345678',
                       :level => 2, :birthdate => Date.today)

admin_user = User.create(:email => 'admin@kater.com', :password => '12345678', :password_confirmation =>'12345678',
                       :level => 1, :birthdate => Date.today)
com = CateringCompany.create(:name=> 'Gourmet', :description=> 'Best company',  :number_of_employes => 5,  :contact_number => 03333333,
                             :address=> 'best address', :city=> 'lahore', :state=> 'punjab', :country=> 'Pakistan',
                             :user => shopKeeper_user)

food = FoodItem.create(:name=>'Burger', :description=>'Yumy burger', :price=>100, :catering_company => com)



food2 = FoodItem.create(:name=>'Piza', :description=>'Yumy Piza', :price=>200, :catering_company => com)
food3 = FoodItem.create(:name=>'Chess', :description=>'Yumy Cheez', :price=>200, :catering_company => com)
food4 = FoodItem.create(:name=>'Shake', :description=>'Yumy Shake', :price=>500, :catering_company => com)

deal1= Deal.create(:name=>'Jumbo Deal', :description=>'Yumy Shakes and fruites', :price=>500, :catering_company => com)
deal2= Deal.create(:name=>'Mega Deal', :description=>'Yumy Shakes and fruites', :price=>200, :catering_company => com)

