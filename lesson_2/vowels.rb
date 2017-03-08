range = Range.new('a','z')
result = {}
vowelsindex = 0
letterindex = 1
vowels = ['a', 'e', 'i', 'o', 'u']
range.each do |letter|
  if letter == vowels[vowelsindex]
    result[letter] = letterindex
    vowelsindex += 1
  end
  letterindex += 1
end
p result
