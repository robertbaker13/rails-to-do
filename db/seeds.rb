# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bob = User.create(username: "bob", email: "bob@bob.com", password: "123456")
bob1 = Task.create(user: bob, content: "walk the dog", completed: false)
bob2 = Task.create(user: bob, content: "wash the dog", completed: false)
bob3 = Task.create(user: bob, content: "feed the dog", completed: false)