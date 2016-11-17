require_relative '../status/status'

class Place

  def change_statu(player)
    Status::TURN_END
  end

  def set_tool(tool)
    @tool = tool
  end

  def tool
    @tool
  end

  def set_player(player)
    @player = player
  end

  def player
    @player
  end

end