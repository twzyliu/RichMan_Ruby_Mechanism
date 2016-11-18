class Tool

  CHEAPEST = 30

  def initialize
    @point = 0
    @num = 0
  end

  def cheapest
    CHEAPEST
  end

  def point
    @point
  end

  def num
    @num
  end

  def set_num(num)
    @num = num
  end

  def use(player, step)
    place = player.game_map.place(player.position + step)
    not_far = (step < 11 and step > -11)
    place_empty = (place.player.nil? and place.tool.nil?)
    if num > 0 and place_empty and not_far
      @num -= 1
      place.set_tool self
    end
  end

  def work(player, position, hospital_position)

  end

end