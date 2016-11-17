require_relative '../status/status'
require_relative '../../src/player'

class SAY_YES_TO_BUY

  def set_player(player)
    @player = player
    self
  end

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

