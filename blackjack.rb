class Deck
  def initialize
    @deck = []
    @count = 0
  end
  def deck_make
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    suits = ["ハート", "ダイヤ", "クラブ", "スペード"]
    suits.each do |suit|
        ranks.each do |rank|
            card = [suit, rank]
            @deck << card
        end
    end
    @deck.shuffle!
  end
  def draw(s, i, q)
    @count += 1
    s << @deck[@count]
    suit, rank = @deck[@count]
    i << rank
    q << suit
  end
  def count
    @count
  end
end

class Calculate
  def initialize
    @score = 0
  end
  def point(card)
    @score = 0
    card.each do |n|
        if n == "A"
            @score += 11
        elsif n.is_a?(String)
            @score += 10
        else
            @score += n.to_i
        end
    end
    if @score > 21 && card.include?("A")
        countA = card.count("A")
        countA.times do
          @score -= 10
          break if @score < 22
        end
        @score
      else
        @score
    end
  end
end

class Judgement
  def judge(a, b)
    if a > b
      p "あなたの勝ちです"
    elsif b > a
      p "ディーラーの勝ちです"
    else
      p "引き分けです"
    end
  end
end


deck = Deck.new
calc = Calculate.new
judge = Judgement.new

deck.deck_make

player_hand = []
player_card = []
player_suit = []
player_score = 0

dealer_hand = []
dealer_card = []
dealer_suit = []
dealer_score = 0

deck.draw(player_hand, player_card, player_suit)
deck.draw(player_hand, player_card, player_suit)
deck.draw(dealer_hand, dealer_card, dealer_suit)
deck.draw(dealer_hand, dealer_card, dealer_suit)

player_score = calc.point(player_card)
dealer_score = calc.point(dealer_card)

p "ブラックジャックを開始します。"
p "あなたの引いたカードは#{player_suit[0]}の#{player_card[0]}です。"
p "あなたの引いたカードは#{player_suit[1]}の#{player_card[1]}です。"
p "ディーラーの引いたカードは#{dealer_suit[0]}の#{dealer_card[0]}です。"
p "ディーラーの引いた2枚目のカードはわかりません。"

count = 1
loop do
  player_score = calc.point(player_card)
  p "あなたの現在の得点は#{player_score}です。カードを引きますか？(Y/N)"
  n = gets.chomp
  if n == 'Y'
    deck.draw(player_hand, player_card, player_suit)
    count += 1
    p "あなたの引いたカードは#{player_suit[count]}の#{player_card[count]}です。"
  elsif n == 'N'
    break
  else
    p '不明な入力です'
  end
end

p "ディーラーの引いた2枚目のカードは#{dealer_suit[1]}の#{dealer_card[1]}でした。"
dealer_count = 1
loop do
  dealer_score = calc.point(dealer_card)
  p "ディーラーの現在の得点は#{dealer_score}です。"
  if dealer_score > 16
    break
  else
    deck.draw(dealer_hand, dealer_card, dealer_suit)
    dealer_count += 1
    p "ディーラーの引いたカードは#{dealer_suit[dealer_count]}の#{dealer_card[dealer_count]}でした。"
  end
end

p "あなたの得点は#{player_score}です。"
p "ディーラーの得点は#{dealer_score}です。"

judge.judge(player_score, dealer_score)

p "ブラックジャックを終了します。"