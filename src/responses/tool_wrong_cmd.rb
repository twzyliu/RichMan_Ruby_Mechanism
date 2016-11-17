require_relative 'response'
require_relative '../status/status'

class TOOL_WRONG_CMD < Response

  def execute
    Status::WAIT_FOR_TOOL_RESPONSE
  end

end