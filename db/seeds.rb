# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Cat.create!(name: "Cat1", age: 10, color: "black", sex: "M", birth_day: "10-10-1999")
c2 = Cat.create!(name: "Cat2", age: 10, color: "brown", sex: "M", birth_day: "10-10-1999")
c3 = Cat.create!(name: "Cat3", age: 10, color: "black", sex: "F", birth_day: "10-10-1999")