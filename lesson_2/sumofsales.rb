basket = {}
by_product = 0
total = 0
loop do
  puts 'Enter product_name'
  puts 'or enter stop for result'
  product_name = gets.chomp
  break if product_name == 'stop'
  puts 'Enter product price'
  price_value = gets.chomp.to_f
  puts 'Enter product quantity'
  quantity_value = gets.chomp.to_i
  basket[product_name] = { price: price_value, quantity: quantity_value }
  by_product = basket[product_name][:price] * basket[product_name][:quantity]
  p basket
  puts "For product #{product_name} you should pay #{by_product}"
  total += by_product
  end
puts "Total payment - #{total}"
