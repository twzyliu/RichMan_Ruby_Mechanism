require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'

class RobotCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @place = Place.new
    flexmock(GameMap, :place => @place)
  end

  def test_should_wait_for_cmd_after_robot
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_CMD, (@player.command Commands::ROBOT_CMD)
  end

  def test_should_change_toolnum_when_robot
    @player.set_statu Status::WAIT_FOR_CMD
    @player.robot.set_num TestHelper::ENOUGH_TOOLS
    tools_num = @player.tools_num

    @player.command Commands::ROBOT_CMD

    assert_equal tools_num - 1, @player.tools_num
  end

  def test_should_not_change_when_no_tool_to_use
    @player.set_statu Status::WAIT_FOR_CMD
    tools_num = @player.tools_num

    @player.command Commands::ROBOT_CMD

    assert_equal tools_num, @player.tools_num
  end

  def test_should_clear_tool_on_gamemap_when_robot
    @player.set_statu Status::WAIT_FOR_CMD
    @player.robot.set_num TestHelper::ENOUGH_TOOLS
    @place.set_tool @player.bomb

    @player.command Commands::ROBOT_CMD

    assert_equal true, @place.tool.nil?
  end

end