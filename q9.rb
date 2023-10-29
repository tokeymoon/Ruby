def print_capitals(capitals)
  # 関数を完成させてください
  capitals.each do |a, b|
    puts "#{a}の首都は#{b}です"
  end
end
print_capitals({ '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' })
