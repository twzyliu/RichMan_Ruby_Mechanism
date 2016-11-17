require_relative 'commands/command'

class Player

  def initialize(game_map)
    @money = 0
    @position = 0
    @game_map = game_map
    @places = []
  end

  def command(command)
    command.execute
  end

  def statu
    @statu
  end

  def set_statu(statu)
    @statu = statu
  end

  def say_yes
    @statu.say_yes(self)
  end

  def say_no
    @statu.say_no
  end

  def money
    @money
  end

  def set_money(money)
    @money = money
  end

  def game_map
    @game_map
  end

  def position
    @position
  end

  def places_num
    @places.size
  end

  def places
    @places
  end

  def wrong_cmd
    @statu.wrong_cmd(self)
  end

  def place
    game_map.get_place position
  end

end