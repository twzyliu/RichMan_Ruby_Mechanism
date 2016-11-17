require_relative 'place'
require_relative '../status/status'

class EmptyLand < Place

  MAX_LEVEL = 3

  def initialize(price)
    @price = price
    @level = 0
  end

  def price
    @price
  end

  def owner
    @owner
  end

  def set_owner(owner)
    @owner = owner
  end

  def level
    @level
  end

  def level_up
    @level += 1
  end

  def max_level
    MAX_LEVEL
  end

  def change_statu(player)
    if owner.nil?
      Status::WAIT_FOR_BUY_RESPONSE
    elsif owner == player
      Status::WAIT_FOR_UPGRADE_RESPONSE
    else
      player.set_money (player.money - bill)
      owner.set_money (owner.money + bill)
      if player.money < 0
        Status::GAME_OVER
      else
        Status::TURN_END
      end
    end
  end

  def bill
    ( 2 ** level ) * price / 2
  end

  def selled
    @owner = nil
    @level = 0
  end

end