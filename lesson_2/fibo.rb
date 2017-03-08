arr = [0,1]
index = 0
i = 0
while i < 89 do
  i = arr[index] + arr[index + 1]
  arr << i
  index += 1
end
p arr
