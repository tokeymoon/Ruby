a, b = gets.split.map(&:to_i)
if (b - a) > 2
  puts "No"
elsif (b - a) < -3
  puts "No"
else
  puts "Yes"
end