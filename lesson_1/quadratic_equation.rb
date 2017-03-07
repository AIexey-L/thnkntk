puts "Please, enter a"
a = gets.chomp.to_i
puts "PLease, enter b"
b = gets.chomp.to_i
puts "Please, enter c"
c = gets.chomp.to_i
diskriminant = (b ** 2) - (4 * a * c)
p diskriminant
if diskriminant < 0
  puts "There is NO roots of the quadratic equation"
elsif diskriminant == 0
  root = (- b )/ 2 * a
  puts "Root of quadratic equation is #{root}"
else
  x1 = ((- b) + Math.sqrt(diskriminant)) / 2 * a
  x2 = ((- b) + Math.sqrt(diskriminant)) / 2 * a
  puts " Roots of quadratic equation are following: #{x1} and #{x2}"
end
