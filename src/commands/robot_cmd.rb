require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class RobotCmd < Command

  def execute
    @player.robot.use(@player,@parameter)
    Status::WAIT_FOR_CMD
  end

end