require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/prison'

class RollCmd_PrisonTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @prison = Prison.new
    flexmock(GameMap, :get_place => @prison)
  end

  def test_should_turn_end_after_roll_to_prison
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

  def test_should_change_prisondays_after_roll_to_prison
    @player.set_statu Status::WAIT_FOR_CMD

    @player.command Commands::ROLL_CMD

    assert_equal @prison.prison_days, @player.prison_days
  end

end