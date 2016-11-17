require_relative '../../src/responses/say_no'
require_relative 'wait_for_cmd'
require_relative 'turn_end'
require_relative 'wait_for_buy_response'
require_relative 'wait_for_upgrade_response'

module Status

  WAIT_FOR_CMD = WAIT_FOR_CMD.new
  TURN_END = TURN_END.new
  WAIT_FOR_BUY_RESPONSE = WAIT_FOR_BUY_RESPONSE.new
  WAIT_FOR_UPGRADE_RESPONSE = WAIT_FOR_UPGRADE_RESPONSE.new

end