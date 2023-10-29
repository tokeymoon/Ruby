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

# Deckクラスのインスタンスを生成
deck = Deck.new

# デッキの情報にアクセス
puts deck.shuffle_deck[0..5]

# Calculateクラスを使用してスコアを計算
calculator = Calculate.new
puts calculator.score(deck.s_rank[0])