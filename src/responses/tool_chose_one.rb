require_relative 'response'
require_relative '../status/status'
require_relative '../tools/barricade'

class TOOL_CHOSE_ONE < Response

  def execute
    point = Barricade.new.point
    if @player.point >= point and @player.tools_num < @player.max_tools_num
      @player.set_point (@player.point - point)
      barricade = @player.barricade
      barricade.set_num (barricade.num + 1)
    end
    Status::WAIT_FOR_TOOL_RESPONSE
  end

end