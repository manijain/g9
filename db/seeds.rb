# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = AdminUser.create!(email: "manish.jain@ireslab.com", password: "manish123", password_confirmation: "manish123")
roles = Role.create!([{ name: 'Admin' }, { name: 'Site Admin' }, { name: 'Normal User' }])

# 50.times do |i|
# 	Property.create!(title: "this is for testing #{i}", location: 'jaipur', approx_price: 200000, approx_sale_duration: '6 month', status: "Not sold", description: "this is for testing.")
# end