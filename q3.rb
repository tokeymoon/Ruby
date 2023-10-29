def fizz_buzz(n)
  # 適当な処理を記載する
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 5 == 0
    'Buzz'
  elsif n % 3 == 0
    'Fizz'
  else
    n.to_i
  end
end
for i in 1..100
  puts fizz_buzz(i)
end
