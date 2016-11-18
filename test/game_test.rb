require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'
require_relative '../src/game_map'
require_relative '../src/places/starting_point'
require_relative '../src/places/empty_land'

class GameTest < Test::Unit::TestCase

  def setup
    @hospital = Hospital.new
    @game_map = GameMap.new [StartingPoint.new, (EmptyLand.new TestHelper::LAND_PRICE), @hospital]
    @player = Player.new TestHelper::PLAYER_NAME, @game_map
  end


  def test_should_return_land_when_get_by_position
    starting_point = @game_map.place TestHelper::STARTING_POINT_NUM

    assert_equal StartingPoint, starting_point.class
  end

  def test_should_stop_when_encounter_barricade
    @player.set_statu Status::WAIT_FOR_CMD
    position = @player.position
    place = @game_map.place TestHelper::TOOL_STEP
    place.set_tool @player.barricade

    @player.command Commands::ROLL_CMD

    assert_equal position + TestHelper::TOOL_STEP, @player.position
    assert_equal nil, place.tool
  end

  def test_should_goto_hospital_when_encounter_bomb
    @player.set_statu Status::WAIT_FOR_CMD
    place = @game_map.place TestHelper::TOOL_STEP
    place.set_tool @player.bomb

    @player.command Commands::ROLL_CMD

    assert_equal @game_map.hospital_position, @player.position
    assert_equal nil, place.tool
    assert_equal @hospital.hospital_days, @player.hospital_days
  end

end