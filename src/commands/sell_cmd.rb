require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class SellCmd < Command

  def execute
    place = @player.game_map.place @parameter
    if place.owner == @player
      place.selled
      @player.set_money (@player.money + place.price)
      @player.places.delete place
    end
    Status::WAIT_FOR_CMD
  end

end