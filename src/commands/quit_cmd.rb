require_relative '../status/status'
require_relative 'commands'
require_relative 'command'

class QuitCmd < Command

  def execute
    Status::EXIT
  end

end