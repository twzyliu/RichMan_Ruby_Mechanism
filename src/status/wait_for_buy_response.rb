require_relative '../responses/responses'

class WAIT_FOR_BUY_RESPONSE

  def say_yes
    Responses::SAY_YES_TO_BUY
  end

  def say_no
    Responses::SAY_NO
  end

  def wrong_cmd
    Responses::WRONG_CMD
  end
end

