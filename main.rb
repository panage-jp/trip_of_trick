require "card"
require "deck"
require "player"
require "referee"
def main()
  #ゲーム準備
  deck = Deck.new()
  referee = Referee.new()
  referee.set_deck(deck)
  round_counter = 1
  end_count = 7
  prev_winner = 1

  #プレイヤー登録
  p "プレイヤーを登録してください\n"
  p "プレイヤー１"
  player1 = Player.new(gets,referee.deal_cards())
  p "プレイヤー2"
  player2 = Player.new(gets,referee.deal_cards())

  #ゲームスタート,デック作成カード表示
  p "ゲームを始めます。\n"
  p "#{player1.name}さんの番です。\n"
  p "#{}が配られました。\nカードを分割してください。\n"
  player1.cut_cards()
  p "#{player2.name}さんの番です。\n"
  p "#{}が配られました。\nカードを分割してください。\n"
  player2.cut_cards()

  p "#{player1.name}さんの番です。\n"
  p "#{}が配られました。\n手札に加えるカードを3枚選んでください。\n"
  player1.choose_cards()
  p "#{player2.name}さんの番です。\n"
  p "#{}が配られました。\n手札に加えるカードを3枚選んでください。\n"
  player2.choose_cards()

  p "#{player1.name}さんの手札は#{player1.hands}です。\n"
  p "#{player2.name}さんの手札は#{player2.hands}です。\n"
  p "ゲームを始めます先手は#{player1.name}さんです。"

  #カードプレイラウンド
  while true do
    p "第#{round_counter}ラウンド"
    
    if prev_winner == 1
      p "#{player1.name}さんの番です。\n"
      p "ハンド：#{player1.hands}\nプレイするカードを選んでください。\n"
      player1.play_a_card()
      
      p "#{player2.name}さんの番です。\n"
      p "ハンド：#{player2.hands}\nプレイするカードを選んでください。\n"
      player2.play_a_card()


    else
    end
    referee.make_a_judgement()
    referee.show_points()
    round_counter +=1
    if round_counter == end_count
      break
    end
  end
  referee.show_winner()
end
