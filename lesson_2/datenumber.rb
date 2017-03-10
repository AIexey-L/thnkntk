puts 'Enter date (day)'
date = gets.chomp.to_i
puts 'Enter month (as a number)'
month = gets.chomp.to_i
puts 'Enter year'
year = gets.chomp.to_i
days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
result = days_in_months.slice(0..month-1).reduce(:+) - (days_in_months[month-1] - date)
result += 1 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
p result
