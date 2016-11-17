require_relative '../status/status'

class SAY_NO

  def execute
    Status::TURN_END
  end

end