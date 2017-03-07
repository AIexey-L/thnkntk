puts "Please, enter a"
a = gets.chomp.to_f
puts "PLease, enter b"
b = gets.chomp.to_f
puts "Please, enter c"
c = gets.chomp.to_f
discriminant = (b ** 2) - (4 * a * c)
if discriminant < 0
  puts "There is NO roots of the quadratic equation"
elsif discriminant == 0
  root = (- b )/ 2 * a
  puts "Root of quadratic equation is #{root}"
else
  sqrt_discriminant = Math.sqrt(discriminant)
  x1 = ((- b) + sqrt_discriminant) / 2 * a
  x2 = ((- b) - sqrt_discriminant) / 2 * a
  puts " Roots of quadratic equation are following: #{x1} and #{x2}"
end
