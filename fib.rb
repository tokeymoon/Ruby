=begin
def fibonacci(n, memo = {})
  return memo[n] if memo.key?(n)
  if n == 0
    result = 0
  elsif n == 1
    result = 1
  else
    result = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
  end
  puts memo
  memo[n] = result
  puts result  
  result
end
=end
def fibonacci(n)
    puts n
    if n <= 1
      return n # 基本ケース
    else
        puts "#{fibonacci(n - 1)}だよ"
      return fibonacci(n - 1) + fibonacci(n - 2) # 再帰ケース
    end
end

puts fibonacci(7)