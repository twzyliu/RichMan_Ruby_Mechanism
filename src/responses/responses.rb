require_relative 'say_no'
require_relative 'say_yes_to_buy'
require_relative 'wrong_cmd'

module Responses

  def execute

  end

  SAY_NO = SAY_NO.new
  SAY_YES_TO_BUY = SAY_YES_TO_BUY.new
  WRONG_CMD = WRONG_CMD.new

end

