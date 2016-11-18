require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'

class HelpCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
  end

  def test_should_wait_for_cmd_after_help
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::WAIT_FOR_CMD, (@player.command Commands::HELP_CMD)
  end

end