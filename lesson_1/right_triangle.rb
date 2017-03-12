# -*- coding: utf-8 -*-
puts 'Please, enter first side of triangle.'
a = gets.chomp.to_f
puts 'Please, enter second side of triangle.'
b = gets.chomp.to_f
puts ' Please, enter third side of triangle.'
c = gets.chomp.to_f
if a > b && a > c
  hipotenuse = a
  cathetus_one = b
  cathetus_two = c
elsif b > a && b > c
  hipotenuse = b
  cathetus_one = a
  cathetus_two = c
elsif c > a && c > b
  hipotenuse = c
  cathetus_one = a
  cathetus_two = b
end
if a == b || a == c || c == b
  puts 'Triangle is isosceles triangle (равнобедренный)'
end
if a == b && a == c
  puts 'Triangle is equilateral.(равносторонний)'
end
if hipotenuse && hipotenuse**2 == (cathetus_one**2) + (cathetus_two**2)
    puts 'Triangle is right (прямоугольный)'
end
