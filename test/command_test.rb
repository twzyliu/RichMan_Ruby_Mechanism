require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative '../src/player'
require_relative '../src/commands/commands'
require_relative '../src/responses/responses'
require_relative '../src/status/status'
require_relative '../src/game_map'


class Command_Test < Test::Unit::TestCase

  def setup
    @player = Player.new flexmock(GameMap)
    @command = Command.new
    @response = Response.new
  end

  def test_should_return_wait_for_cmd_after_respondless_cmd
    flexmock(@command, :execute => Status::WAIT_FOR_CMD)

    assert_equal Status::WAIT_FOR_CMD, (@player.command @command)
  end

  def test_should_return_wait_for_response_after_respondful_cmd
    flexmock(@command, :execute => Status::WAIT_FOR_BUY_RESPONSE)

    assert_equal Status::WAIT_FOR_BUY_RESPONSE, (@player.command @command)
  end

  def test_should_return_turn_end_after_after_noneed_respond_cmd
    flexmock(@command, :execute => Status::TURN_END)

    assert_equal Status::TURN_END, (@player.command @command)
  end

  def test_should_return_turn_end_after_respond
    flexmock(@response, :execute => Status::TURN_END)

    assert_equal Status::TURN_END, (@player.command @response)
  end

end
