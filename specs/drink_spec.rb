require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestBar < Minitest::Test

  def setup
    @drink = Drink.new("Beer", 2, 10)
  end

  def test_get_drink_name
    assert_equal("Beer", @drink.name)
  end

  def test_get_drink_price
    assert_equal(2, @drink.price)
  end

  def test_can_get_drink_stock_level
    assert_equal(10, @drink.stock_level)
  end

  def test_can_add_or_remove_drink_stock_level__reduces
    @drink.add_or_remove_drink_stock(-2)
    assert_equal(8, @drink.stock_level)
  end

  def test_can_add_or_remove_drink_stock_level__adds
    @drink.add_or_remove_drink_stock(2)
    assert_equal(12, @drink.stock_level)
  end

end
