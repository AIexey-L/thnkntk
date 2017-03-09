puts 'Enter date (day)'
date = gets.chomp.to_i
puts 'Enter month (as a number)'
month = gets.chomp.to_i - 2
puts 'Enter year'
year = gets.chomp.to_i
days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

# Check, if it's a leap year
if year % 4 == 0
  days_in_months[1] = 29
end
if year % 4 == 0 && year % 100 == 0
  days_in_months[1] = 28
end
if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
  days_in_months[1] = 29
end
if month < 0
  result = date
else
  result = days_in_months.slice(0..month).reduce(:+) + date
end
p result
