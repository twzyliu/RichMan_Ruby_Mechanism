require_relative 'commands/commands'

class Player

  def initialize(game_map)
    @money = 0
    @point = 0
    @position = 0
    @god_days = 0
    @prison_days = 0
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

  def chose_one
    @statu.chose_one
  end

  def chose_two
    @statu.chose_two
  end

  def chose_three
    @statu.chose_three
  end

  def money
    @money
  end

  def set_money(money)
    @money = money
  end

  def point
    @point
  end

  def set_point(point)
    @point = point
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

  def god_days
    @god_days
  end

  def gain_god
    @god_days += place.gift_god
  end

  def prison_days
    @prison_days
  end

  def goto_prison
    @prison_days += place.prison_days
  end

end