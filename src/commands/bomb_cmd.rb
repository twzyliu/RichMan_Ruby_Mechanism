require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class BombCmd < Command

  def execute
    @player.bomb.use(@player,@parameter)
    Status::WAIT_FOR_CMD
  end

end