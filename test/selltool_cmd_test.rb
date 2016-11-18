require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'

class SelltoolCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
  end

  def test_should_wait_for_cmd_after_selltool
    @player.set_statu Status::WAIT_FOR_CMD
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS

    assert_equal Status::WAIT_FOR_CMD, (@player.command Commands::SELLTOOL_CMD)
  end

  def test_should_change_point_and_toolsnum_when_selltool
    @player.set_statu Status::WAIT_FOR_CMD
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS
    point = @player.point
    tools_num = @player.tools_num

    @player.command (Commands::SELLTOOL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal point + @player.barricade.point, @player.point
    assert_equal tools_num - 1, @player.tools_num
  end

  def test_should_not_change_when_no_tool_to_sell
    @player.set_statu Status::WAIT_FOR_CMD
    point = @player.point
    tools_num = @player.tools_num

    @player.command (Commands::SELLTOOL_CMD.set_parameter TestHelper::SELL_NUM)

    assert_equal point, @player.point
    assert_equal tools_num, @player.tools_num
  end
  
end