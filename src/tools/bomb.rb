require_relative 'tool'

class Bomb < Tool

  def initialize
    super
    @point = 50
  end

  def work(player, position, hospital_position)
    player.goto_hospital hospital_position
  end

end