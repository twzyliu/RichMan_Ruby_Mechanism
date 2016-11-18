require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'

class BlockCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
    @place = Place.new
    flexmock(GameMap, :place => @place)
  end

  def test_should_wait_for_cmd_after_block
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_CMD, (@player.command Commands::BLOCK_CMD)
  end


  def test_should_change_toolnum_when_block
    @player.set_statu Status::WAIT_FOR_CMD
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS
    tools_num = @player.tools_num

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::TOOL_STEP)

    assert_equal tools_num - 1, @player.tools_num
  end

  def test_should_change_land_status_when_block
    @player.set_statu Status::WAIT_FOR_CMD
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::TOOL_STEP)

    assert_equal @player.barricade, @place.tool
  end

  def test_should_not_change_when_no_tool_to_use
    @player.set_statu Status::WAIT_FOR_CMD

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::TOOL_STEP)

    assert_equal true, @place.tool.nil?
  end

  def test_should_not_change_when_use_tool_but_player_on_target_land
    @player.set_statu Status::WAIT_FOR_CMD
    @place.set_player @player
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::TOOL_STEP)

    assert_equal true, @place.tool.nil?
  end

  def test_should_not_change_when_use_tool_but_some_tool_on_target_land
    @player.set_statu Status::WAIT_FOR_CMD
    @place.set_tool @player.bomb
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::TOOL_STEP)

    assert_equal @player.bomb, @place.tool
  end

  def test_should_not_change_when_target_land_too_faraway
    @player.set_statu Status::WAIT_FOR_CMD
    @player.barricade.set_num TestHelper::ENOUGH_TOOLS

    @player.command Commands::BLOCK_CMD.set_parameter(TestHelper::LONG_STEP)

    assert_equal true, @place.tool.nil?
  end

end