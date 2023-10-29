# カードデッキの初期化
suits = %w[Hearts Diamonds Clubs Spades]
ranks = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]

deck = suits.product(ranks).shuffle

# プレイヤーとディーラーの初期手札
player_hand = []
dealer_hand = []

# 手札からカードを引くメソッド
def deal_card(hand, deck)
  hand << deck.pop
end

# 手札の合計を計算するメソッド
def calculate_total(hand)
  total = 0
  values = hand.map { |card| card[1] }

  values.each do |value|
    total += if value == 'Ace'
               11
             elsif value.to_i == 0
               10
             else
               value.to_i
             end
  end

  values.select { |value| value == 'Ace' }.count.times do
    break if total <= 21

    total -= 10
  end

  total
end

# 初期手札を配る
2.times { deal_card(player_hand, deck) }
2.times { deal_card(dealer_hand, deck) }

# プレイヤーのターン
while true
  puts "プレイヤーの手札: #{player_hand}, 合計: #{calculate_total(player_hand)}"
  puts "ディーラーのカード: #{dealer_hand[0]}"

  if calculate_total(player_hand) == 21
    puts 'ブラックジャック！プレイヤーの勝ち！'
    exit
  elsif calculate_total(player_hand) > 21
    puts 'バースト！プレイヤーの負け...'
    exit
  end

  puts 'ヒットまたはスタンド？（h/s）'
  choice = gets.chomp.downcase

  if choice == 'h'
    deal_card(player_hand, deck)
  elsif choice == 's'
    break
  end
end

# ディーラーのターン
deal_card(dealer_hand, deck) while calculate_total(dealer_hand) < 17

puts "プレイヤーの手札: #{player_hand}, 合計: #{calculate_total(player_hand)}"
puts "ディーラーの手札: #{dealer_hand}, 合計: #{calculate_total(dealer_hand)}"

# 勝敗判定
if calculate_total(dealer_hand) > 21
  puts 'ディーラーがバースト！プレイヤーの勝ち！'
elsif calculate_total(player_hand) > calculate_total(dealer_hand)
  puts 'プレイヤーの勝ち！'
elsif calculate_total(player_hand) < calculate_total(dealer_hand)
  puts 'ディーラーの勝ち...'
else
  puts '引き分けです。'
end
