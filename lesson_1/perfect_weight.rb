puts 'Please, enter your name'
name = gets.chomp
puts 'Please, enter your height'
height  = gets.chomp
perfect_weight = height.to_i - 110
if perfect_weight < 0
  puts "Dear #{name}, your weight is already optimal."
else
  puts "Dear #{name}, you perfect weight should be #{perfect_weight}kg."
end
