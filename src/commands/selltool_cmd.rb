require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class SelltoolCmd < Command

  def execute
    tool = @player.tools[@parameter - 1]
    if tool.num > 0
      tool.set_num (tool.num - 1)
      @player.set_point (@player.point + tool.point)
    end
    Status::WAIT_FOR_CMD
  end

end