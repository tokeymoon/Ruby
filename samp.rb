class Deck
  attr_accessor :shuffle_deck, :s_rank

  def initialize
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
  end
end

class Calculate
  def score(i)
    if i == "A"
      11
    elsif i.is_a?(String)
      10
    else
      i.to_i
    end
  end
end

class DealerHand
  def initialize(s_rank)
    @dealer_hand = 0
    @n = 0
    @dh_rank = deck.s_rank

    loop do
      if @dealer_hand > 16
        break
      end

      @dealer_hand = @dealer_hand + score(@dh_rank[@n])
      @n += 1
    end
  end
  attr_accessor :dealer_hand, :n
end

# Deckクラスのインスタンスを生成
deck = Deck.new

# DealerHandクラスのインスタンスを生成
dealer_hand = DealerHand.new(deck)

# インスタンス変数にアクセスしてディーラーの手札とnを表示
puts dealer_hand.dealer_hand
puts dealer_hand.n
