require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'
require_relative '../src/places/empty_land'

class SellCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @own_land = EmptyLand.new TestHelper::LAND_PRICE
    @own_land.set_owner @player
    flexmock(GameMap, :place => @own_land)
  end

  def test_should_wait_for_cmd_after_sell
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_CMD, (@player.command Commands::SELL_CMD)
  end


  def test_should_change_landnum_when_sell
    @player.set_statu Status::WAIT_FOR_CMD
    @player.places << @own_land
    places_num = @player.places_num

    @player.command (Commands::SELL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal places_num - 1, @player.places_num
  end

  def test_should_change_land_ownner_when_sell
    @player.set_statu Status::WAIT_FOR_CMD
    @player.places << @own_land

    @player.command (Commands::SELL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal true, @own_land.owner.nil?
  end

  def test_should_change_land_level_when_sell
    @player.set_statu Status::WAIT_FOR_CMD
    @player.places << @own_land

    @player.command (Commands::SELL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal 0, @own_land.level
  end

  def test_should_gain_money_when_sell
    @player.set_statu Status::WAIT_FOR_CMD
    @player.places << @own_land
    money = @player.money

    @player.command (Commands::SELL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal money + @own_land.price, @player.money
  end

  def test_should_not_change_when_no_land_to_sell
    @player.set_statu Status::WAIT_FOR_CMD
    @own_land.set_owner nil
    places_num = @player.places_num
    money = @player.money

    @player.command (Commands::SELL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal money, @player.money
    assert_equal places_num, @player.places_num
  end

end