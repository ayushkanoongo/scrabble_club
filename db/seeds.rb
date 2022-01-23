# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(11..30).each do |i|
  Member.create(
    first_name: "Jhon #{i}",
    last_name: "Deo #{i}",
    email: "jhondeo#{i}@gmail.com",
    phone: "96321456#{i}"
  )
end