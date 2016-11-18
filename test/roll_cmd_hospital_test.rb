require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/hospital'

class RollCmd_HospitalTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @hospital = Hospital.new
    flexmock(GameMap, :move => @hospital)
  end

  def test_should_turn_end_after_roll_to_hospital
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

end