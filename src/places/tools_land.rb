require_relative 'place'
require_relative '../../src/tools/tool'

class ToolsLand < Place


  def change_statu(player)
    if player.point < Tool.new.cheapest
      Status::TURN_END
    else
      Status::WAIT_FOR_TOOL_RESPONSE
    end
  end

end