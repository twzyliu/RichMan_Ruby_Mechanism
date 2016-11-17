require_relative '../status/status'
require_relative '../../src/places/gift_land'
require_relative 'response'

class GIFT_CHOSE_THREE < Response

  def execute
    @player.gain_god
    Status::TURN_END
  end

end