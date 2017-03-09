# basket = { product => { price => qty } }
basket = Hash.new { |h, product| h[product] = Hash.new { |hh, price| hh[price] = qty } }
# by_product = { product => [price, qty] }
by_product_sum = Hash.new { |product, k| product[k] = Array.new }
loop do
  puts 'Enter product name'
  puts 'or enter stop for result'
  product = gets.chomp.to_s
  break if product == 'stop'
puts 'Enter product price'
price = gets.chomp.to_f
puts 'Enter product quantity'
qty = gets.chomp.to_f
basket[product][price] = qty
by_product_sum[product] = basket[product].to_a.reduce(:*)
end
p basket
p by_product
