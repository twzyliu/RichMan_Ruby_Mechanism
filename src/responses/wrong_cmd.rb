require_relative 'response'

class WRONG_CMD < Response

  def execute
    @player.statu
  end

end