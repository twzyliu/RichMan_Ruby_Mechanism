require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/places/tools_land'
require_relative '../src/tools/barricade'


class RollCmd_ToolsLandTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @tools_land = ToolsLand.new
    flexmock(GameMap, :place => @tools_land)
  end

  def test_should_wait_for_tool_response_after_roll_to_toolland
    @player.set_statu Status::WAIT_FOR_CMD
    @player.set_point TestHelper::ENOUGH_POINT

    assert_equal Status::WAIT_FOR_TOOL_RESPONSE, (@player.command Commands::ROLL_CMD)
  end

  def test_should_turn_end_when_no_enough_point
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE

    assert_equal Status::TURN_END, (@player.command Commands::ROLL_CMD)
  end

  def test_should_change_point_when_chose_tool_1_and_have_enough_poit
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE
    @player.set_point TestHelper::ENOUGH_POINT
    point = @player.point

    @player.command @player.chose_one

    assert_equal point - Barricade.new.point, @player.point
  end

  def test_should_change_toolNum_when_chose_tool_1_and_have_enough_potin
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE
    @player.set_point TestHelper::ENOUGH_POINT
    tools_num = @player.tools_num

    @player.command @player.chose_one

    assert_equal tools_num + 1, @player.tools_num
  end

  def test_should_wait_for_tool_response_afer_chose_tool
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE

    assert_equal Status::WAIT_FOR_TOOL_RESPONSE, (@player.command @player.chose_one)
  end

  def test_should_no_change_when_no_enough_point_to_buy_tool
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE
    point = @player.point
    tools_num = @player.tools_num

    @player.command @player.chose_one

    assert_equal tools_num, @player.tools_num
    assert_equal point, @player.point
  end

  def test_should_no_change_when_no_space_to_buy_tool
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE
    @player.set_point TestHelper::ENOUGH_POINT
    (0...@player.max_tools_num).each { |i|
      @player.command @player.chose_one
    }
    point = @player.point
    tools_num = @player.tools_num

    @player.command @player.chose_one

    assert_equal tools_num, @player.tools_num
    assert_equal point, @player.point
  end

  def test_should_turn_end_when_chose_exit_cmd
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE

    assert_equal Status::TURN_END, (@player.command @player.exit_cmd)
  end

  def test_should_wait_for_tool_response_when_chose_wrong_cmd
    @player.set_statu Status::WAIT_FOR_TOOL_RESPONSE

    assert_equal Status::WAIT_FOR_TOOL_RESPONSE, (@player.command @player.wrong_cmd)
  end

end