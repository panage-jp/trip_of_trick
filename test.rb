require "./card"
require "./deck"
require "./player"
require "./referee"

#set_deckテスト
deck = Deck.new()
referee = Referee.new()
referee.set_deck(deck)
for i in deck.cards do
  p i.suit,i.number
end