number = gets.to_i
result = 0
h = (number / 100) % 10
d = (number / 10) % 10
n = number % 10
puts h, d, n
puts n == (h * d)
l = number
for i in 1..999
    h = (l / 100) % 10
    d = (l / 10) % 10
    n = l % 10
  if n == (h * d)
    break
  end
  l = number + i
end

result = l
puts result