# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# seed users
user = {}

ActiveRecord::Base.transaction do
	30.times do
		user['user_name'] = Faker::Name.middle_name
		user['email'] = Faker::Internet.email
		user['password'] = "12345678"
		user['bio'] = Faker::Hipster.paragraph(1)
		user['role'] = rand(0..2)
		
		User.create!(user)
	end
end 


# Seed posts
post = {}
user_ids = []
User.all.each { |user| user_ids << user.id }

ActiveRecord::Base.transaction do
	50.times do 
		post['caption'] = Faker::Hipster.sentence(1).gsub(".", "")
		post['user_id'] = user_ids.sample
		post['image'] = Faker::LoremPixel.image
		
		Post.create!(post)
	end
end