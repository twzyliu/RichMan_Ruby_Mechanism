require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'
require_relative '../src/places/empty_land'
require_relative '../src/game_map'


class RollCmd_EmptyLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @empty_land = EmptyLand.new TestHelper::LAND_PRICE
    flexmock(GameMap, :get_place => @empty_land)
  end

  def test_should_wait_for_buy_response_after_roll_to_emptyland
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_BUY_RESPONSE, (@player.command (Commands::ROLL_CMD.set_player @player))
  end


  def test_should_turn_end_after_sayYes
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    assert_equal Status::TURN_END, (@player.command @player.say_yes)
  end

  def test_should_change_money_after_sayYes
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    @player.command @player.say_yes

    assert_equal TestHelper::ENOUGH_MONEY - TestHelper::LAND_PRICE, @player.money
  end

  def test_should_add_land_after_sayYes
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY
    places_num = @player.places_num

    @player.command @player.say_yes

    assert_equal places_num + 1, @player.places_num
  end

  def test_should_change_land_owner_after_sayYes
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE
    @player.set_money TestHelper::ENOUGH_MONEY

    @player.command @player.say_yes

    assert_equal @player, @empty_land.owner
  end

  def test_should_turn_end_when_sayYes_no_enough_money
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE

    assert_equal Status::TURN_END, (@player.command @player.say_yes)
  end

  def test_should_turn_end_after_sayNo
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE

    assert_equal Status::TURN_END, (@player.command @player.say_no)
  end

  def test_should_wait_for_buy_response_after_wrong_cmd
    @player.set_statu Status::WAIT_FOR_BUY_RESPONSE

    assert_equal Status::WAIT_FOR_BUY_RESPONSE, (@player.command @player.wrong_cmd)
  end

end
