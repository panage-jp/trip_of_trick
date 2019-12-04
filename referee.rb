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
    

  end
  
  def make_a_judgement()
  end

  def show_points()
  end

  def show_winner()
  end
  

end