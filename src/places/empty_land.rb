require_relative 'place'

class EmptyLand < Place

  def initialize(price)
    @price = price;
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

end