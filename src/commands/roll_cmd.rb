require_relative '../status/status'
require_relative 'commands'
require_relative 'command'
require_relative '../player'

class RollCmd < Command

  def execute
    @player.roll.change_statu @player
  end

end