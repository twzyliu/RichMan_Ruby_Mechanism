require_relative '../status/status'
require_relative 'command'

class RollCmd

  def execute
    Status::WAIT_FOR_BUY_RESPONSE
  end

end