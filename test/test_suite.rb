require 'test/unit/testsuite'
require_relative 'command_test'
require_relative 'roll_cmd_empty_land_test'
require_relative 'roll_cmd_own_land_test'
require_relative 'roll_cmd_gift_land_test'
require_relative 'roll_cmd_starting_point_test'
require_relative 'roll_cmd_others_land_test'
require_relative 'roll_cmd_magic_land_test'
require_relative 'roll_cmd_hospital_test'
require_relative 'roll_cmd_prison_test'
require_relative 'roll_cmd_mine_land_test'
require_relative 'roll_cmd_tools_land_test'
require_relative 'block_cmd_test'
require_relative 'bomb_cmd_test'
require_relative 'robot_cmd_test'

class Test_Suite
  def self.suite
    suite = Test::Unit::TestSuite.new
    suite << Command_Test.suite
    suite << RollCmd_EmptyLandTest.suite
    suite << RollCmd_OwnLandTest.suite
    suite << RollCmd_GiftLandTest.suite
    suite << RollCmd_StartingPointTest.suite
    suite << RollCmd_OthersLandTest.suite
    suite << RollCmd_MagicLandTest.suite
    suite << RollCmd_HospitalTest.suite
    suite << RollCmd_PrisonTest.suite
    suite << RollCmd_MineLandTest.suite
    suite << RollCmd_ToolsLandTest.suite
    suite << BlockCmdTest.suite
    suite << BombCmdTest.suite
    suite << RobotCmdTest.suite
    return suite
  end
end

Test::Unit::UI::Console::TestRunner.run(Test_Suite)