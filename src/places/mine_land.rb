require_relative 'place'

class MineLand < Place

  def initialize(point)
    @point = point
  end

  def point
    @point
  end

  def change_statu(player)
    player.set_point (player.point + point)
    Status::TURN_END
  end

end