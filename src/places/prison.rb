require_relative 'place'

class Prison < Place

  PRISON_DAYS=2

  def prison_days
    PRISON_DAYS
  end

  def change_statu(player)
    player.goto_prison
    Status::TURN_END
  end

end