require_relative 'say_no'
require_relative 'say_yes_to_buy'
require_relative 'wrong_cmd'
require_relative 'say_yes_to_upgrade'
require_relative 'wrong_cmd_to_gift'
require_relative 'gift_chose_one'
require_relative 'gift_chose_two'
require_relative 'gift_chose_three'
require_relative 'tool_chose_one'
require_relative 'tool_exit'
require_relative 'tool_wrong_cmd'

module Responses

  SAY_NO = SAY_NO.new
  SAY_YES_TO_BUY = SAY_YES_TO_BUY.new
  WRONG_CMD = WRONG_CMD.new
  SAY_YES_TO_UPGRADE = SAY_YES_TO_UPGRADE.new
  WRONG_CMD_TO_GIFT = WRONG_CMD_TO_GIFT.new
  GIFT_CHOSE_ONE = GIFT_CHOSE_ONE.new
  GIFT_CHOSE_TWO = GIFT_CHOSE_TWO.new
  GIFT_CHOSE_THREE = GIFT_CHOSE_THREE.new
  TOOL_CHOSE_ONE = TOOL_CHOSE_ONE.new
  TOOL_EXIT = TOOL_EXIT.new
  TOOL_WRONG_CMD = TOOL_WRONG_CMD.new

end

