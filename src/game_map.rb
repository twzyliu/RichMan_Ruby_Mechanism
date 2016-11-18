require_relative 'places/place'
require_relative '../src/places/hospital'

class GameMap

  def initialize(places)
    @places = places
  end

  def place(position)
    @places[position % @places.size]
  end

  def move(player)
    target = 0
    step = rand(6)+1
    (1..step).each { |i|
      target = (player.position + i) % @places.size
      place = place target
      unless place.tool.nil?
        target = place.tool.work player, target, hospital_position
        place.set_tool nil
        break
      end
    }
    place target
  end

  def hospital_position
    (0...@places.size).each { |i|
      if @places[i].class == Hospital
        return i
      end
    }
  end

end

