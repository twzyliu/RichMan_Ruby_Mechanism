require_relative 'tool'

class Robot < Tool

  def initialize
    super
    @point = 30
    @step = 10
  end

  def use(player, step)
    if num > 0
      (1..@step).each { |i|
        place = player.game_map.place (player.position + i)
        place.set_tool nil
      }
      @num -= 1
    end
  end
end