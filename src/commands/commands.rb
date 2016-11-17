require_relative 'roll_cmd'
require_relative 'block_cmd'
require_relative 'bomb_cmd'
require_relative 'robot_cmd'

module Commands

  ROLL_CMD = RollCmd.new
  BLOCK_CMD = BlockCmd.new
  BOMB_CMD = BombCmd.new
  RobotCmd = RobotCmd.new

end