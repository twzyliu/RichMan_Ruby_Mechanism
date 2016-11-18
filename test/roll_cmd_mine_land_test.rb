require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/mine_land'


class RollCmd_MineLandTest < Test::Unit::TestCase


  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @mine_land = MineLand.new TestHelper::MINE_POINT
    flexmock(GameMap, :move => @mine_land)
  end

  def test_should_turn_end_after_roll_to_mineland
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

  def test_should_gain_potin_after_roll_to_mineland
    @player.set_statu Status::WAIT_FOR_CMD
    point = @player.point

    @player.command Commands::ROLL_CMD

    assert_equal point + @mine_land.point, @player.point
  end

end