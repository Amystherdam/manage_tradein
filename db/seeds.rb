puts 'Creating one store manager into the database...'
store_manager = User.create(
  email: "store_manager@tradein.com", 
  password: "123456"
)

UserProfile.create(
  name: "Store Manager", 
  phone: "85988887777", 
  gender: "O", 
  role: "store_manager", 
  user: store_manager
)
puts 'Insert successfully completed!'
puts '============================================'

puts 'Creating one salesman into the database...'
salesman = User.create(
  email: "salesman@tradein.com", 
  password: "123456"
)

UserProfile.create(
  name: "Salesman", 
  phone: "85988887777", 
  gender: "O", 
  user: salesman
)
puts 'Insert successfully completed!'
puts '============================================'

puts 'Inserting some products into the database...'
40.times do 
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 0.5...250.0),
    description: Faker::Commerce.department(max: 5)
  )
end
puts 'Insert successfully completed!'
puts '============================================'

puts 'Inserting some customers into the database...'
25.times do 
  Customer.create(
    name: Faker::Name.name,
    birthdate: Faker::Date.between(from: '1952-01-01', to: '2003-01-01'),
  )
end
puts 'Insert successfully completed!'
puts '============================================'

puts 'Inserting some sales into the database...'
count = 1
200.times do
  product = []
  customer_id = rand(1..Customer.all.size)
  product_id = rand(1..Product.all.size)
  product_quantiti = rand(1..100)
  products_per_sale = rand(1..10)

  products_per_sale.times do
    product.push("[{:id=>#{rand(1..product_id)}, :quantiti=>#{rand(1..product_quantiti)}}]")
  end

  Sale.create(
    customer_id: customer_id,
    product: product,
    date_sale: Faker::Date.between(from: '2022-01-01', to: '2022-12-31')
  )
  puts "#{count}º flawless randomization"
  count += 1
end
puts 'Insert successfully completed!'
puts '============================================'
