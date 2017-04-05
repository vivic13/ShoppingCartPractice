namespace :db do

	task :fake => :environment do
	Product.destroy_all
		10.times do 
			Product.create!(
				name: Faker::Name.name,
				price: Faker::Number.between(500, 1000),
				cost: Faker::Number.between(100, 400),
				quantity: Faker::Number.between(100, 1000)
			)
		end
	end
	
end