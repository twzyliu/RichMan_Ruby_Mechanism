require_relative '../status/status'
require_relative '../../src/player'
require_relative 'response'

class SAY_YES_TO_BUY < Response

  def execute
    place = @player.place
    if @player.money > place.price
      @player.set_money (@player.money - place.price)
      @player.places << place
      place.set_owner @player
    end
    Status::TURN_END
  end

end

