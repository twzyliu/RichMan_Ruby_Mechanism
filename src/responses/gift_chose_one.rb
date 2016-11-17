require_relative '../status/status'
require_relative '../../src/places/gift_land'
require_relative 'response'

class GIFT_CHOSE_ONE < Response

  def execute
    place = @player.place
    @player.set_money (@player.money + place.gift_money)
    Status::TURN_END
  end

end