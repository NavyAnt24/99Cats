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

request1 = CatRentalRequest.create!(cat_id: 1, start_date: "10-10-2010", end_date: "11-10-2010")
request2 = CatRentalRequest.create!(cat_id: 2, start_date: "12-10-2010", end_date: "1-10-2011")
request3 = CatRentalRequest.create!(cat_id: 1, start_date: "10-12-2010", end_date: "11-12-2010", status: "APPROVED")
conflicting_request = CatRentalRequest.create!(cat_id: 1, start_date: "01-01-2010", end_date: "01-01-2011", status: "PENDING")