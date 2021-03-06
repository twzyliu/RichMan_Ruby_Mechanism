require_relative '../../src/responses/say_no'
require_relative 'wait_for_cmd'
require_relative 'turn_end'
require_relative 'wait_for_buy_response'
require_relative 'wait_for_upgrade_response'
require_relative 'wait_for_gift_response'
require_relative 'game_over'
require_relative 'wait_for_tool_response'
require_relative 'exit'
require_relative 'wait_for_init_money'
require_relative 'wait_for_init_player'

module Status

  WAIT_FOR_CMD = WAIT_FOR_CMD.new
  TURN_END = TURN_END.new
  WAIT_FOR_BUY_RESPONSE = WAIT_FOR_BUY_RESPONSE.new
  WAIT_FOR_UPGRADE_RESPONSE = WAIT_FOR_UPGRADE_RESPONSE.new
  WAIT_FOR_GIFT_RESPONSE = WAIT_FOR_GIFT_RESPONSE.new
  GAME_OVER = GAME_OVER.new
  WAIT_FOR_TOOL_RESPONSE = WAIT_FOR_TOOL_RESPONSE.new
  EXIT = EXIT.new
  WAIT_FOR_INIT_MONEY = WAIT_FOR_INIT_MONEY.new
  WAIT_FOR_INIT_PLAYER = WAIT_FOR_INIT_PLAYER.new

end