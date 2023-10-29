# トランプカードの配列を生成
suits = ["ハート", "ダイアモンド", "クラブ", "スペード"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]


deck = []


suits.each do |suit|
  ranks.each do |rank|
    card = [suit, rank]
    deck << card
  end
end


@shuffle_deck = deck.shuffle

@s_rank = []

@shuffle_deck.each do |card|
    suit, rank = card
     @s_rank << rank
    puts card
  end
  

puts "カードは"
puts @s_rank[1]
puts @shuffle_deck[0]
#putu shuffle_deck[0(rank)]


puts "ブラックジャックを開始します。"
puts "あなたの引いたカードは#{@shuffle_deck[0]}"
puts "あなたの引いたカードは#{@shuffle_deck[1]}"
puts "ディーラーの引いたカードは#{@shuffle_deck[2]}"
puts "ディーラーの引いたカードはわかりません"#shuffle_deck[3]