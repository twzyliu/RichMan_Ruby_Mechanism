require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class BlockCmd < Command

  def execute
    @player.barricade.use(@player,@parameter)
    Status::WAIT_FOR_CMD
  end

end