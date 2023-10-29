# 1つの整数を受け取る
n = gets.to_i

# スペースで区切られた2つの整数を受け取る
a, b = gets.split.map(&:to_i)

# 文字列を受け取る
text = gets.chomp

puts n
puts a
puts text
