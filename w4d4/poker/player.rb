class Player
  def initialize(*player)
    @player = 
  end

  def action
    p "what do you want to do?"
    p "for fold press f"
    p "for see press s"
    p "for raise press r"

    act = gets.chomp
    raise 'not a valid action' if !"frs".include?(act)

    if act == 'f'
      self.fold
    elsif act == 'r'
      self.raising
    else 
      self.see
    end
  end

end