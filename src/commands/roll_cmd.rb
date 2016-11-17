require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class RollCmd < Command

  def execute
    place = @player.place
    place.change_statu @player
  end

end