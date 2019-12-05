class Player 
  attr_accessor :dealt_hands, :name,:first_half,:second_half,:play_hands,:got_cards

  def initialize(name,dealt_hands=[],first_half=[],second_half=[],play_hands=[],got_cards=[])
    @name,@dealt_hands,@first_half,@second_half,@play_hands,@got_cards= name,dealt_hands,first_half,second_half,play_hands,got_cards
  end

  #自分の手札を表示
  def show_dealt()
    cards_list = []
    for i in self.dealt_hands
      card = i.suit + i.number.to_s
      cards_list << card
    end
    return cards_list
  end

  def show_first()
    cards_list = []
    for i in self.first_half
      card = i.suit + i.number.to_s
      cards_list << card
    end
    return cards_list
  end

  def show_second()
    cards_list = []
    for i in self.second_half
      card = i.suit + i.number.to_s
      cards_list << card
    end
    return cards_list
  end

  def show_play()
    cards_list = []
    for i in self.play_hands
      card = i.suit + i.number.to_s
      cards_list << card
    end
    return cards_list
  end

  def show_got()
    cards_list = []
    for i in self.got_cards
      card = i.suit + i.number.to_s
      cards_list << card
    end
    return cards_list
  end

  #配られたカードを分割
  def cut_cards(list)
    self.first_half = []
    self.second_half = []
    for i in 0..5
      if list.include?(i.to_s)
        self.first_half << self.dealt_hands[i]
      else
        self.second_half << self.dealt_hands[i]
      end
    end
  end


  #分割されたカードを選択
  def choose_cards(num,opponent)
    if num == 0
      for i in opponent.first_half
        self.play_hands << i
      end
      for i in opponent.second_half
        opponent.play_hands << i
      end
    elsif num == 1
      for i in opponent.second_half
        self.play_hands << i
      end
      for i in opponent.first_half
        opponent.play_hands << i
      end
    end
  end

#カードをプレイ
  def play_a_card(num,field)
    chosen_card = self.play_hands.slice!(num)
    field << chosen_card
  end

  def caliculate_point()
    cards_classification = {
      #"suit" => [枚数,最大値]
      "h" => [0,0],
      "c" => [0,0],
      "s" => [0,0],
      "d" => [0,0],
      "t" => [0,0]
    }
    score = 0
    for i in self.got_cards do
      cards_classification["#{i.suit}"][0] += 1
      if cards_classification["#{i.suit}"][1] < i.number
        cards_classification["#{i.suit}"][1] = i.number
      end
    end
    cards_classification.each do |key,value|
      score += value[0]*value[1]
    end
    return score
  end
end