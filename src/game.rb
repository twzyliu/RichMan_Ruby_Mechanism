require_relative 'status/status'
require_relative 'places/starting_point'
require_relative 'places/empty_land'
require_relative 'places/tools_land'
require_relative 'places/prison'
require_relative 'places/magic_land'
require_relative 'places/mine_land'

class Game

  DEFAULT_MONEY = 10000

  def initialize
    @statu = Status::WAIT_FOR_CMD
    @money = DEFAULT_MONEY
    @players = []
  end

  def statu
    @statu
  end

  def set_statu(statu)
    @statu = statu
  end

  def command(command)
    command.execute
  end

  def init_money(money)
    @money = money
    Status::WAIT_FOR_INIT_PLAYER
  end

  def init_player(player_names)
    player_names.each { |name|
      game_map = init_game_map
      player = Player.new name, game_map
      player.set_money @money
      @players << player
    }
    Status::WAIT_FOR_CMD
  end

  def init_game_map
    places = []
    mine_land_points = [20,80,100,40,80,60]
    places << StartingPoint.new
    (0...2*13+1).each { |i|
      if i==13
        places << Hospital.new
      end
      places << (EmptyLand.new 200)
    }
    places << ToolsLand.new
    (0...6).each { |i|
      places << (EmptyLand.new 500)
    }
    places << GiftLand.new
    (0...2*13+1).each { |i|
      if i==13
        places << Prison.new
      end
      places << (EmptyLand.new 300)
    }
    places << MagicLand.new
    for i in 0...6
      places << (MineLand.new mine_land_points[i])
    end
    GameMap.new places
  end

end