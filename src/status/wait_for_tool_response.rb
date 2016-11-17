require_relative '../../src/responses/responses'

class WAIT_FOR_TOOL_RESPONSE

  def chose_one
    Responses::TOOL_CHOSE_ONE
  end

  def exit_cmd
    Responses::TOOL_EXIT
  end

  def wrong_cmd
    Responses::TOOL_WRONG_CMD
  end

end