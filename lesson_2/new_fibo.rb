arr = [0,1]
i = 1
while arr[i] + arr[i-1] <= 100
  arr << arr[i] + arr[i-1]
  i += 1
end
p arr
