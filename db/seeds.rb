# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'

user1 = User.create! :username => 'administrator', :email => 'administrator@example.com', :password => '1q2w3e4r@q!', :password_confirmation => '1q2w3e4r@q!', :confirmed_at => DateTime.now

puts 'New user created: ' << user1.username


user1.add_role :admin



