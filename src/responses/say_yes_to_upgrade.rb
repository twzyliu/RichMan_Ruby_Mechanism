require_relative '../status/status'
require_relative '../player'
require_relative 'response'

class SAY_YES_TO_UPGRADE < Response

  def execute
    place = @player.place
    if @player.money > place.price and place.level < place.max_level
      @player.set_money (@player.money - place.price)
      place.level_up
      Status::TURN_END
    else
      Status::WAIT_FOR_UPGRADE_RESPONSE
    end
  end

end