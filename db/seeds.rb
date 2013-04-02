# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = User.create(:username => "Aaron", :email => "a@bing.com")
r = User.create(:username => "Rich", :email => "r@bing.com")
s = User.create(:username => "Sphero", :email => "s@bing.com")

poll1 = a.create_poll("Favorite Poll")
poll2 = r.create_poll("Favorite Colors")

p1q1 = poll1.create_question("What is your favorite poll?")
p1q1.create_responses("Poll 1", "Poll 2", "Poll 3")

p2q1 = poll2.create_question("What is your favorite color?")
p2q1.create_responses("Red", "Blue", "Green", "Yellow")
p2q2 = poll2.create_question("What is your least favorite color?")
p2q2.create_responses("Red", "Blue", "Green", "Yellow")

