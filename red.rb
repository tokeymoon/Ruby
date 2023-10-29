suits = ["ハート", "ダイアモンド", "クラブ", "スペード"]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

deck = []

suits.each do |suit|
    ranks.each do |rank|
      card = [suit, rank]
      deck << card
    end
  end

shuffle_deck = deck.shuffle

shuffle_deck.each do |card|
    s_suit, s_rank = card
end

player_hand = 0
dealer_hand = 0

def calc(i)
    if i.is_a?(String)
      retern 10
    else
      retern i.to_i
    end

end

calc()

puts 