namespace :db do

	task :fake => :environment do
	Product.destroy_all
		10.times do 
			Product.create!(
				name: Faker::Name.name,
				price: Faker::Number.between(500, 1000),
				quantity: Faker::Number.between(100, 1000),
				image:  Faker::Avatar.image
			)
		end
	end
	
end