require 'test/unit/testsuite'
require_relative 'command_test'
require_relative 'roll_cmd_empty_land_test'
require_relative 'roll_cmd_own_land_test'

class Test_Suite
  def self.suite
    suite = Test::Unit::TestSuite.new
    suite << Command_Test.suite
    suite << RollCmd_EmptyLandTest.suite
    suite << RollCmd_OwnLandTest.suite
    return suite
  end
end

Test::Unit::UI::Console::TestRunner.run(Test_Suite)