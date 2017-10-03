# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bouquets = [{name: 'Alice', price: 20}, {name: 'Charlotte', price: 22.5}, {name: 'Isabel', price: 30}]

bouquets.each do |b|
  Bouquet.find_or_create_by!(b)
end

orders = [
  {
    recipient_name: 'Test01',
    delivery_on: '2017-09-24',
    special_delivery: 'true',
    three_month_bundle: 'true'
  },
  {
    recipient_name: 'Test02',
    delivery_on: '2017-09-24',
    special_delivery: 'false',
    three_month_bundle: 'false'
  },
  {
    recipient_name: 'Test03',
    delivery_on: '2017-07-24',
    special_delivery: 'true',
    three_month_bundle: 'true'
  },
  {
    recipient_name: 'Test04',
    delivery_on: '2017-07-24',
    special_delivery: 'true',
    three_month_bundle: 'true'
  },
  {
    recipient_name: 'Test05',
    delivery_on: '2017-09-24',
    special_delivery: 'true',
    three_month_bundle: 'false'
  },
  {
    recipient_name: 'Test06',
    delivery_on: '2017-09-23',
    special_delivery: 'true',
    three_month_bundle: 'false'
  },
  {
    recipient_name: 'Test07',
    delivery_on: '2017-09-27',
    special_delivery: 'false',
    three_month_bundle: 'true'
  },
  {
    recipient_name: 'Test08',
    delivery_on: '2017-08-24',
    special_delivery: 'false',
    three_month_bundle: 'true'
  },
  {
    recipient_name: 'Test09',
    delivery_on: '2017-08-24',
    special_delivery: 'false',
    three_month_bundle: 'false'
  },
]

orders.each do |ord|
  bouquet = Bouquet.offset(rand(Bouquet.count)).first

  Order.create!(
    recipient_name: ord[:recipient_name],
    bouquet: bouquet,
    delivery_on: ord[:delivery_on],
    special_delivery: ord[:special_delivery],
    three_month_bundle: ord[:three_month_bundle],
  )
end




