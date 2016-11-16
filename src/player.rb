require_relative 'command/command'

class Player

  def command(command)
    command.execute
  end

end