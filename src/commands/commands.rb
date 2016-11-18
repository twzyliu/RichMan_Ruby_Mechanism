require_relative 'roll_cmd'
require_relative 'block_cmd'
require_relative 'bomb_cmd'
require_relative 'robot_cmd'
require_relative 'sell_cmd'
require_relative 'selltool_cmd'
require_relative 'query_cmd'
require_relative 'help_cmd'
require_relative 'quit_cmd'
require_relative 'rich_cmd'

module Commands

  ROLL_CMD = RollCmd.new
  BLOCK_CMD = BlockCmd.new
  BOMB_CMD = BombCmd.new
  ROBOT_CMD = RobotCmd.new
  SELL_CMD = SellCmd.new
  SELLTOOL_CMD = SelltoolCmd.new
  QUERY_CMD = QueryCmd.new
  HELP_CMD = HelpCmd.new
  QUIT_CMD = QuitCmd.new
  RICH_CMD = RichCmd.new

end