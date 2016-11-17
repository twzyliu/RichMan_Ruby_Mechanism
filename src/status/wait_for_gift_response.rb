require_relative '../../src/responses/responses'

class WAIT_FOR_GIFT_RESPONSE

  def wrong_cmd(player)
    Responses::WRONG_CMD_TO_GIFT
  end

  def chose_one
    Responses::GIFT_CHOSE_ONE
  end

  def chose_two
    Responses::GIFT_CHOSE_TWO
    end

  def chose_three
    Responses::GIFT_CHOSE_THREE
  end

end