# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(name: "vijay", user_name:"vijay maurya",email: "vmaurya1989@gmail.com" ,phone: "12345678",country:"india",city: "india" ,password:"12345678",password_confirmation: "12345678")
user.save!
user.add_role(:customer)
