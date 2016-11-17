
class Response

  def execute
    Status::TURN_END
  end

  def set_player(player)
    @player = player
    self
  end

end