require_relative 'commands/commands'
require_relative 'tools/barricade'
require_relative 'tools/robot'
require_relative 'tools/bomb'
require_relative 'game_map'

class Player

  MAX_TOOLS_NUM = 10

  def initialize(name,game_map)
    @name = name
    @money = 0
    @point = 0
    @position = 0
    @god_days = 0
    @prison_days = 0
    @hospital_days = 0
    @game_map = game_map
    @places = []
    @barricade = Barricade.new
    @robot = Robot.new
    @bomb = Bomb.new
    @tools = [ @barricade, @robot, @bomb ]

  end

  def command(command)
    (command.set_player self).execute
  end

  def statu
    @statu
  end

  def set_statu(statu)
    @statu = statu
  end

  def say_yes
    @statu.say_yes
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

  def set_position(position)
    @position = position
  end

  def places_num
    @places.size
  end

  def places
    @places
  end

  def wrong_cmd
    @statu.wrong_cmd
  end

  def exit_cmd
    @statu.exit_cmd
  end

  def place
    @game_map.place position
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

  def tools_num
    @barricade.num + @robot.num + @bomb.num
  end

  def barricade
    @barricade
  end

  def robot
    @robot
  end

  def bomb
    @bomb
  end

  def max_tools_num
    MAX_TOOLS_NUM
  end

  def tools
    @tools
  end

  def roll
    @game_map.move self
  end

  def goto_hospital(hospital_position)
    @position = hospital_position
    @hospital_days = place.hospital_days
    @position
  end

  def hospital_days
    @hospital_days
  end

end
