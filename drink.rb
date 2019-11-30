class Drink

  attr_reader :name, :price, :stock_level

  def initialize(name, price, stock_level)
    @name = name
    @price = price
    @stock_level = stock_level
  end

  def add_or_remove_drink_stock(amount)
    @stock_level += amount
  end

end
