require_relative 'place'
require_relative '../status/status'

class GiftLand < Place

  GIFT_MONEY = 2000
  GIFT_POINT = 200
  GIFT_GOD = 5

  def change_statu(player)
    Status::WAIT_FOR_GIFT_RESPONSE
  end

  def gift_money
    GIFT_MONEY
  end

  def gift_point
    GIFT_POINT
  end

  def gift_god
    GIFT_GOD
  end

end