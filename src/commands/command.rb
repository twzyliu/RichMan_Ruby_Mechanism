require_relative '../status/status'

class Command

  def set_player(player)
    @player = player
    self
  end

  def set_parameter(parameter)
    @parameter = parameter
    self
  end

  def execute
    Status::WAIT_FOR_CMD
  end

end