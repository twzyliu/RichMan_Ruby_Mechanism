require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/magic_land'

class RollCmd_MagicLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @magic_land = MagicLand.new
    flexmock(GameMap, :move => @magic_land)
  end

  def test_should_turn_end_after_roll_to_magicland
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

end