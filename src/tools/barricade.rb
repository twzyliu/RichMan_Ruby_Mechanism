require_relative 'tool'

class Barricade < Tool

  def initialize
    super
    @point = 50
  end

  def use(player, step)
    barricade = player.barricade
    place = player.game_map.place(player.position + step)
    not_far = (step < 11 and step > -11)
    place_empty = (place.player.nil? and place.tool.nil?)
    if barricade.num > 0 and place_empty and not_far
      @num -= 1
      place.set_tool barricade
    end
  end


end