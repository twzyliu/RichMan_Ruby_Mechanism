require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/places/empty_land'

class RollCmd_OwnLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @empty_land = EmptyLand.new TestHelper::LAND_PRICE
    @empty_land.set_owner @player
    flexmock(GameMap, :place => @empty_land)
  end

  def test_should_wait_for_upgrade_response_after_roll_to_Ownland
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_UPGRADE_RESPONSE, (@player.command Commands::ROLL_CMD)
  end

  def test_should_turn_end_after_sayYes
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    assert_equal Status::TURN_END, (@player.command @player.say_yes)
  end

  def test_should_change_money_after_sayYes
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    @player.command @player.say_yes

    assert_equal TestHelper::ENOUGH_MONEY - @empty_land.price, @player.money
  end

  def test_should_change_land_level_after_sayYes
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY
    level = @empty_land.level

    @player.command @player.say_yes

    assert_equal level + 1, @empty_land.level
  end

  def test_should_turn_end_after_sayNo
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    assert_equal Status::TURN_END, (@player.command @player.say_no)
  end

  def test_should_wait_for_buy_response_after_wrong_cmd
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    assert_equal Status::WAIT_FOR_UPGRADE_RESPONSE, (@player.command @player.wrong_cmd)
  end

  def test_should_no_change_when_level_is_max
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY
    (0...@empty_land.max_level).each { |i|
      @empty_land.level_up
    }
    level = @empty_land.level

    @player.command @player.say_yes

    assert_equal level, @empty_land.level
  end

  def test_should_no_change_when_no_enough_money
    @player.set_statu Status::WAIT_FOR_UPGRADE_RESPONSE

    assert_equal Status::WAIT_FOR_UPGRADE_RESPONSE, (@player.command @player.say_yes)
  end

end