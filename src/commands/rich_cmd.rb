require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class RichCmd < Command

  def execute
    Status::WAIT_FOR_INIT_MONEY
  end

end