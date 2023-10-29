a, b = gets.split.map(&:to_i)
n = a * b
n = n % 2
case n
when 0
  puts 'Even'
else
  puts 'Odd'
end
