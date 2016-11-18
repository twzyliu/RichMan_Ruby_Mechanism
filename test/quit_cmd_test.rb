require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'

class QuitCmdTest < Test::Unit::TestCase

  def setup
    @player = Player.new TestHelper::PLAYER_NAME, flexmock(GameMap)
  end

  def test_should_exit_after_quit
    @player.set_statu Status::WAIT_FOR_CMD

    assert_equal Status::EXIT, (@player.command Commands::QUIT_CMD)
  end

end