require "./card"
require "./deck"
require "./player"
require "./referee"
def main()
  #ゲーム準備
  deck = Deck.new()
  referee = Referee.new()
  referee.set_deck(deck)
  round_counter = 1
  end_count = 7
  prev_winner = 1

  #プレイヤー登録
  puts "プレイヤーを登録してください\n"
  puts "プレイヤー１"
  player1 = Player.new(gets.chomp,referee.deal_cards(deck))
  puts "-------------------------------------------------"
  puts "プレイヤー2"
  player2 = Player.new(gets.chomp,referee.deal_cards(deck))

  #ゲームスタート,デック作成カード表示
  puts "-------------------------------------------------"
  print "ゲームを始めます。\n"
  puts "#{player1.name}さんの番です。\n"
  puts "#{player1.show_dealt}が配られました。\nカードを3枚選択してください。\n"
  list = gets.split(" ")
  player1.cut_cards(list)
  puts "-------------------------------------------------"
  puts "#{player2.name}さんの番です。\n"
  puts "#{player2.show_dealt}が配られました。\nカード３枚選択してください。\n"
  list = gets.split(" ")
  player2.cut_cards(list)



  puts "-------------------------------------------------"
  puts "#{player1.name}さんの番です。\n"
  puts "#{player2.show_first}/#{player2.show_second}が提示されました。\n手札に加えるカードを選んでください。\n"
  input = gets.to_i
  player1.choose_cards(input,player2)
  puts "-------------------------------------------------"
  puts "#{player2.name}さんの番です。\n"
  puts "#{player1.show_first}/#{player1.show_second}が提示されました。\n手札に加えるカードを選んでください。\n"
  input = gets.to_i
  player2.choose_cards(input,player1)

  puts "-------------------------------------------------"
  puts "#{player1.name}さんの手札は#{player1.show_play}です。\n"
  puts "-------------------------------------------------"
  puts "#{player2.name}さんの手札は#{player2.show_play}です。\n"
  puts "-------------------------------------------------"
  puts "ゲームを始めます。先手は#{player1.name}さんです。"

  #カードプレイラウンド
  while true do
    puts "第#{round_counter}ラウンド"
    field = []
    
    if prev_winner == 1 #先手後手の条件
      puts "-------------------------------------------------"
      puts "#{player1.name}さんの番です。\n"
      puts "ハンド：#{player1.show_play}\nプレイするカードを選んでください。\n"
      input = gets.to_i
      player1.play_a_card(input,field)
      puts "-------------------------------------------------"
      puts "#{player2.name}さんの番です。\n"
      puts "ハンド：#{player1.name}さんは、#{field[0].suit}#{field[0].number}をプレイしました。\n"
      puts "ハンド：#{player2.show_play}\nプレイするカードを選んでください。\n"
      input = gets.to_i
      player2.play_a_card(input,field)
      puts "-------------------------------------------------"
      if referee.make_a_judgement(field) == 0
        puts "#{player1.name}さんが#{field[0].suit}#{field[0].number}を獲得しました。"
        player1.got_cards << field[0]
      else
        puts "#{player2.name}さんが#{field[1].suit}#{field[1].number}を獲得しました。"
        player2.got_cards << field[1]
        prev_winner = 2
      end
    else
      puts "-------------------------------------------------"
      puts "#{player2.name}さんの番です。\n"
      puts "ハンド：#{player2.show_play}\nプレイするカードを選んでください。\n"
      input = gets.to_i
      player2.play_a_card(input,field)
      puts "-------------------------------------------------"
      puts "#{player1.name}さんの番です。\n"
      puts "ハンド：#{player2.name}さんは、#{field[0].suit}#{field[0].number}をプレイしました。\n"
      puts "ハンド：#{player1.show_play}\nプレイするカードを選んでください。\n"
      input = gets.to_i
      player1.play_a_card(input,field)
      puts "-------------------------------------------------"
      if referee.make_a_judgement(field) == 0
        puts "#{player2.name}さんが#{field[0].suit}#{field[0].number}を獲得しました。"
        player2.got_cards << field[0]
      else
        puts "#{player1.name}さんが#{field[1].suit}#{field[1].number}を獲得しました。"
        prev_winner = 1
        player1.got_cards << field[1]
      end
    end
    puts "-------------------------------------------------"
    puts "#{player1.name}さんの獲得カードは#{player1.show_got}です。"
    puts "#{player1.name}さんの獲得点数は#{player1.caliculate_point}です。"
    puts "-------------------------------------------------"
    puts "#{player2.name}さんの獲得カードは#{player2.show_got}です。"
    puts "#{player2.name}さんの獲得点数は#{player2.caliculate_point}です。"
    puts "-------------------------------------------------"
    round_counter +=1
    if round_counter == end_count
      break
    end
  end
  if referee.show_winner(player1,player2)
    puts "#{referee.show_winner(player1,player2).name}さんが勝ちました"
  else
    puts "引き分けです"
  end
  puts "-------------------------------------------------"
end

main()
