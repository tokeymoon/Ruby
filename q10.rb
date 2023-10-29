def convert_currency(amount, source_currency, target_currency, conversion_rates)
  # 関数を完成させてください
  a = conversion_rates [target_currency]
  b = conversion_rates [source_currency]
  puts a.to_i
  puts b.to_i
  c = (a / b) * amount.to_i
  puts c
end
conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}

convert_currency(100, :usd, :jpy, conversion_rates)
