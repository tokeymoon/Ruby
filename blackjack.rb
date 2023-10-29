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
  attr_accessor 
  def initialize
    @s_rank = []
    @deck = []
    @pint = 0
    @dint = 0
  end
  def deckmake
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    suits = ["ハート", "ダイアモンド", "クラブ", "スペード"]
    suits.each do |suit|
      ranks.each do |rank|
        card = [suit, rank]
        @deck << card
      end
    end
  end

  def shuff
    @deck.shuffle!
  end

  def pdraw(hand)
      @pint += 1
      hand.player_hand <<  @deck[@pint]
  end

  def ddraw(hand)
      @dint -= 1
      hand.dealer_hand << @deck[@dint]
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
    @dealer_hand = []
    @dealer_card = 0
    @n = 0
  end
  def loop
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
    @player_hand = []
    @player_score = 0
    @m = 0
  end
  def loop
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

deck = Deck.new
phand = PlayerHand.new
dhand = DealerHand.new

deck.deckmake
deck.shuff
p deck.pdraw(phand)
p deck.pdraw(phand)
p deck.ddraw(dhand)
p deck.ddraw(dhand)