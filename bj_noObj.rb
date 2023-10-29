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
  end



def score(i)
    if i == "A"
        11
    elsif i.is_a?(String)
        10
    else
        i.to_i
    end
end

#puts @shuffle_deck[0..5]


@player_hand = 0
@player_card = []

@dealer_hand = 0
@dealer_card = []

n = 0
loop do
  if @dealer_hand > 16
    break
  end
    @dealer_hand = @dealer_hand + score(@s_rank[n])
    @dealer_card << @s_rank[n]
    if @dealer_hand > 21 && (@dealer_card[n] == "A")
        @dealer_hand = @dealer_hand -10
    end
    n += 1
end

m = 0
loop do
  if @player_hand > 16
    break
  end
    @player_hand = @player_hand + score(@s_rank[51 - m])
    @player_card << @s_rank[51 - m]
    if @player_hand > 21 && (@player_card[51 - m] == "A")
        @player_hand = @player_hand -10
    end
    m += 1
end

puts @dealer_hand
puts @dealer_card

puts "境界"

puts @player_hand
puts @player_card