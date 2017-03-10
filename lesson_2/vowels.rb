range = ('a'..'z')
result = {}
vowels = %w( a e i o u )
range.each.with_index(1) { |letter, index| result[letter] = index if vowels.include?(letter) }
p result
