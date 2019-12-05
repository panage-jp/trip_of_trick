require "./card"
require "./deck"
require "./player"
require "./referee"

#set_deckテスト
deck = Deck.new()
referee = Referee.new()
referee.set_deck(deck)

#deal_cardsテスト
hands = referee.deal_cards(deck)
hands_opponent = referee.deal_cards(deck)
# for hand in hands do
#   puts hand.number
# end
#プレイヤーテスト
player = Player.new("test",hands)
opponent = Player.new("opponent",hands_opponent)
player.cut_cards(["0","1","2"])
opponent.cut_cards(["0","1","2"])
player.choose_cards(0,opponent)
opponent.choose_cards(0,player)



# puts player.show_play
# puts "-----------------------"
# puts player_opponent.show_play

# puts player.show_dealt()

# for i in player.first_half do
#   puts i.number
# end 

# for i in player.second_half
#   puts i.number
# end

field = []

#勝敗判定テスト
player.play_a_card(1,field)
opponent.play_a_card(1,field)

# puts field[0].suit,field[0].number
# puts field[1].suit,field[1].number

win = referee.make_a_judgement(field)
player.got_cards << field[1]
# puts win.suit,win.number

#点数計算テスト
puts player.show_got
puts player.caliculate_point()
