# ブラックジャックを開始します。
# あなたの引いたカードはハートの7です。
# あなたの引いたカードはクラブの8です。
# ディーラーの引いたカードはダイヤのQです。
# ディーラーの引いた2枚目のカードはわかりません。
# あなたの現在の得点は15です。カードを引きますか？（Y/N）
# Y
# あなたの引いたカードはスペードの５です。
# あなたの現在の得点は20です。カードを引きますか？（Y/N）
# N
# ディーラーの引いた2枚目のカードはダイヤの2でした。
# ディーラーの現在の得点は12です。
# ディーラーの引いたカードはハートのKです。
# あなたの得点は20です。
# ディーラーの得点は22です。
# あなたの勝ちです！
# ブラックジャックを終了します。]
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
  attr_accessor :deal_card, :dealer_hand, :n
  def initialize
    @dealer_hand = 0
  @dealer_card = []
  @n = 0
  loop do
  if @dealer_hand > 16
    break
  end
    @dealer_hand = @dealer_hand + score(@s_rank[@n])
    @dealer_card << @s_rank[@n]
    if @dealer_hand > 21 && (@dealer_card[@n] == "A")
        @dealer_hand = @dealer_hand -10
    end
    @n += 1
   end
  end
end

class PlayerHand
  attr_accessor :player_card, :player_hand, :m
  def initialize
    @player_hand = 0
    @player_card = []
    @m = 0
loop do
  if @player_hand > 16
    break
  end
    @player_hand = @player_hand + score(@s_rank[51 - @m])
    @player_card << @s_rank[51 - @m]
    if @player_hand > 21 && (@player_card[51 - @m] == "A")
        @player_hand = @player_hand -10
    end
    @m += 1
end
  end
end

# Deckクラスのインスタンスを生成
deck = Deck.new

# Calculateクラスを使用してスコアを計算
calculator = Calculate.new
puts calculator.score(deck.s_rank[0])

# DealerHandクラスのインスタンスを生成
dealer = DealerHand.new
player = PlayerHand.new

# インスタンス変数にアクセスしてディーラーの手札を表示
puts dealer.dealer_hand
puts dealer.dealer_card
