require 'test/unit'
require 'flexmock/test_unit'
require 'test/unit/ui/console/testrunner'
require_relative '../src/status/wait_for_cmd'
require_relative '../src/player'
require_relative '../src/command/command'
require_relative '../src/response/response'

class Command_Test < Test::Unit::TestCase

  def setup
    @command = Command.new
    @player = Player.new
    @response = Response.new
  end

  def test_should_return_wait_for_cmd_after_respondless_cmd
    flexmock(@command, :execute => :WAIT_FOR_CMD)

    status = @player.command @command

    assert_equal :WAIT_FOR_CMD, status
  end

  def test_should_return_wait_for_response_after_respondful_cmd
    flexmock(@command, :execute => :WAIT_FOR_RESPONSE)

    status = @player.command @command

    assert_equal :WAIT_FOR_RESPONSE, status
  end

  def test_should_return_turn_end_after_after_noneed_respond_cmd
    flexmock(@command, :execute => :TURN_END)

    status = @player.command @command

    assert_equal :TURN_END, status
  end

  def test_should_return_turn_end_after_respond
    flexmock(@response, :execute => :TURN_END)

    status = @player.command @response

    assert_equal :TURN_END, status
  end

end

Test::Unit::UI::Console::TestRunner.run(Command_Test)