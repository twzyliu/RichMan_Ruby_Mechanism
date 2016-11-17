require_relative '../status/status'
require_relative '../../src/places/gift_land'
require_relative 'response'

class GIFT_CHOSE_TWO < Response

  def execute
    place = @player.place
    @player.set_point (@player.point + place.gift_point)
    Status::TURN_END
  end

end