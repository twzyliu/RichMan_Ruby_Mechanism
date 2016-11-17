require_relative '../status/status'
require_relative 'command'

class RollCmd

  def set_player(player)
    @player = player
    self
  end

  def execute
    place = @player.place
    if place.owner.nil?
      Status::WAIT_FOR_BUY_RESPONSE
    elsif place.owner == @player
      Status::WAIT_FOR_UPGRADE_RESPONSE
    end
  end

end