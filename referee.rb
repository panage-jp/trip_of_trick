class Referee 
  attr_accessor :point_memory

  def initialize(point_memory=[0,0])
    @point_memory = point_memory
  end

  def set_deck(deck)
  cards=[]
  for j in ["h","c","s","d"] do
    for i in 1..12 do
      card = Card.new(j,i)
      cards << card
    end
  end
  for i in 1..6 do
    card = Card.new("t",i,true)
    cards << card
  end
  deck.cards = cards
end

  def deal_cards(deck)
    hands = []
    for i in 1..6 do
      deck.cards.shuffle!
      hands << deck.cards.pop()
    end
    return hands
  end
  

  #fieldに出されたカードの勝敗判定
  def make_a_judgement(field)
    if field[0].suit == field[1].suit #場にあるカードが同じスートの場合
      if field[0].number > field[1].number
        return 1
      else
        return 0
      end
    else#場にあるカードが違うスートの場合
      if field[0].suit == "t" || field[1].suit == "t"#切り札が出されていた場合
        if  field[0].suit =="t"
          return 0
        else
          return 1
        end
      else
        return 0
      end
    end

  end


  def show_winner(player1,player2)
    if player1.caliculate_point > player2.caliculate_point
      return player1
    elsif player1.caliculate_point < player2.caliculate_point
      return player2
    else
      return nil
    end
  end
  

end