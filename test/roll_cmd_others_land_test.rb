require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/empty_land'

class RollCmd_OthersLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @other = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @others_land = EmptyLand.new TestHelper::LAND_PRICE
    @others_land.set_owner (@other)
    flexmock(GameMap, :move => @others_land)
  end

  def test_should_turn_end_after_roll_to_other
    @player.set_statu Status::WAIT_FOR_CMD
    @player.set_money TestHelper::ENOUGH_MONEY

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

  def test_should_change_my_money_after_roll_to_other
    @player.set_statu Status::WAIT_FOR_CMD
    @player.set_money TestHelper::ENOUGH_MONEY
    money = @player.money

    @player.command Commands::ROLL_CMD

    assert_equal money - @others_land.bill, @player.money
  end

  def test_should_change_others_money_after_roll_to_other
    @player.set_statu Status::WAIT_FOR_CMD
    @player.set_money TestHelper::ENOUGH_MONEY
    money = @other.money

    @player.command Commands::ROLL_CMD

    assert_equal money + @others_land.bill, @other.money
  end

  def test_should_gameover_when_no_enough_money_to_pay
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::GAME_OVER, (@player.command Commands::ROLL_CMD)
  end

end