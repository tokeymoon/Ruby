def print_names(names)
  # 関数を完成させてください
  # puts "1.#{names[0]}"
  # puts "2.#{names[1]}"
  # puts "3.#{names[2]}"
  names.each_with_index { |names, i| puts "#{i + 1}:#{names}" }
end
print_names(%w[上田 田仲 堀田])

def square(numbers)
  # 関数を完成させてください
  numbers.map do |n|
    n**2
  end
end
squared_numbers = square([5, 7, 10])
print squared_numbers


def select_even_numbers(numbers)
  # 関数を完成させてください
  numbers.select do |n|
    n.even?
  end
end
even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print even_numbers
