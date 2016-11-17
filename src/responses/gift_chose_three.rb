require_relative '../status/status'
require_relative '../../src/places/gift_land'
require_relative 'response'

class GIFT_CHOSE_THREE < Response

  def execute
    place = @player.place
    @player.set_god_days place.gift_god
    Status::TURN_END
  end

end