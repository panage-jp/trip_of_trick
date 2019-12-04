class Player 
  attr_accessor :hands, :name

  def initialize(name,hands=[])
    @name,@hands = name,hands
  end

  def play_a_card()
    
  end
  
  def cut_cards
  end
  
  def choose_cards
  end
end