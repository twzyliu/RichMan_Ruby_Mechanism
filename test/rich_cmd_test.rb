require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative 'test_helper'
require_relative '../src/status/status'
require_relative '../src/commands/commands'
require_relative '../src/player'
require_relative '../src/game'

class RichCmdTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_should_wait_for_init_money_after_rich
    assert_equal Status::WAIT_FOR_INIT_MONEY, (@game.command Commands::RICH_CMD)
  end


  def test_should_wait_for_init_player_after_init_money
    @game.set_statu Status::WAIT_FOR_INIT_MONEY

    assert_equal Status::WAIT_FOR_INIT_PLAYER, (@game.init_money TestHelper::INIT_MONEY)
  end

  def test_should_wait_for_cmd_after_init_player
    @game.set_statu Status::WAIT_FOR_INIT_PLAYER

    assert_equal Status::WAIT_FOR_CMD, (@game.init_player TestHelper::PLAYER_NAMES)
  end

end