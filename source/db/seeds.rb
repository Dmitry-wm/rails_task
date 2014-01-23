# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
customers = [
  {
    first_name: "Dean",
    last_name: "Martin",
    email: "dean.martin@culini.com",
  },
  {
    first_name: "Buddy",
    last_name: "Rich",
    email: "buddy.rich@culini.com"
  },
  {
    first_name: "Miles",
    last_name: "Davis",
    email: "miles.davis@culini.com"
  },
  {
    first_name: "Billie",
    last_name: "Holiday",
    email: "billie.holiday@culini.com"
  }
]

customers = customers.map{ |c_attr| Customer.create(c_attr) }

#succeed charges
5.times do
  customers[0].charges << Charge.new(paid:true, refunded: false, currency: "usd", amount: Random.new.rand * 100)
end

3.times do
  customers[1].charges << Charge.new(paid:true, refunded: false, currency: "usd", amount: Random.new.rand * 100)
end

customers[2].charges << Charge.new(paid:true, refunded: false, currency: "usd", amount: Random.new.rand * 100)
customers[3].charges << Charge.new(paid:true, refunded: false, currency: "usd", amount: Random.new.rand * 100)

#failed charges
3.times do
  customers[2].charges << Charge.new(paid:false, refunded: false, currency: "usd", amount: Random.new.rand * 100)
end

2.times do
  customers[3].charges << Charge.new(paid:false, refunded: false, currency: "usd", amount: Random.new.rand * 100)
end

#disputed charges
3.times do
  customers[0].charges << Charge.new(paid:true, refunded: true, currency: "usd", amount: Random.new.rand * 100)
end

2.times do
  customers[1].charges << Charge.new(paid:true, refunded: true, currency: "usd", amount: Random.new.rand * 100)
end
