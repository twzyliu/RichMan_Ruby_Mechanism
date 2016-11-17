require_relative 'place'

class EmptyLand < Place

  MAX_LEVEL = 3

  def initialize(price)
    @price = price
    @level = 0
  end

  def price
    @price
  end

  def owner
    @owner
  end

  def set_owner(owner)
    @owner = owner
  end

  def level
    @level
  end

  def level_up
    @level += 1
  end

  def max_level
    MAX_LEVEL
  end

end