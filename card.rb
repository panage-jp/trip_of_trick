class Card
  attr_accessor :suit, :number, :trump

  def initialize(suit,number,trump=false)
    @suit,@number,@trump = suit,number,trump
  end
end
