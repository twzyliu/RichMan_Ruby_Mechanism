require_relative '../responses/responses'

class WAIT_FOR_UPGRADE_RESPONSE

  def say_yes(player)
    Responses::SAY_YES_TO_UPGRADE.set_player player
  end

  def say_no
    Responses::SAY_NO
  end

  def wrong_cmd(player)
    Responses::WRONG_CMD.set_player player
  end

end