require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/gift_land'

class RollCmd_GiftLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @gift_land = GiftLand.new
    flexmock(GameMap, :get_place => @gift_land)
  end

  def test_should_wait_for_gift_response_after_roll_to_giftland
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_GIFT_RESPONSE, (@player.command (Commands::ROLL_CMD.set_player @player))
  end

  def test_should_turn_end_after_wrong_cmd
    @player.set_statu Status::WAIT_FOR_GIFT_RESPONSE

    assert_equal Status::TURN_END, (@player.command @player.wrong_cmd)
  end

  def test_should_change_money_after_chose_1
    @player.set_statu Status::WAIT_FOR_GIFT_RESPONSE
    money = @player.money

    @player.command (@player.chose_one.set_player @player)

    assert_equal money + @gift_land.gift_money, @player.money
  end

  def test_should_change_point_after_chose_2
    @player.set_statu Status::WAIT_FOR_GIFT_RESPONSE
    point = @player.point

    @player.command (@player.chose_two.set_player @player)

    assert_equal point + @gift_land.gift_point, @player.point
  end

  def test_should_get_god_after_chose_3
    @player.set_statu Status::WAIT_FOR_GIFT_RESPONSE

    @player.command (@player.chose_three.set_player @player)

    assert_equal @gift_land.gift_god, @player.god_days
  end

end