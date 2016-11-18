require_relative 'tool'

class Barricade < Tool

  def initialize
    super
    @point = 50
  end

  def work(player, position, hospital_position)
    player.set_position position
  end

end