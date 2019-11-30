require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../guest')
require_relative('../drink')


class TestBar < Minitest::Test

  def setup
    @bar1 = Bar.new("Room1_bar")
    @drink = Drink.new("Beer", 2, 10)
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie", 30)
  end

  def test_get_bar_name
    assert_equal("Room1_bar", @bar1.bar_name)
  end

  def test_check_bar_tab_is_empty_at_start
    assert_equal(0, @bar1.get_bar_tabs.length)
  end

  def test_can_get_all_bar_drinks
    assert_equal(0, @bar1.get_drinks.length)
  end

  def test_can_get_drink_stock_level
    assert_equal(10, @drink.stock_level)
  end

  def test_bar_till_is_empty_at_start
    assert_equal(0, @bar1.bar_till)
  end

  def test_can_add_drink_to_bar
    assert_equal(1, @bar1.add_drink_to_bar(@drink).length)
  end

  def test_can_create_bar_tab
    @bar1.create_bar_tab(@guest)
    assert_equal(1, @bar1.get_bar_tabs.length)
  end

  # def test_can_give_array_of_customer_bar_tab
  #   @bar1.create_bar_tab(@guest)
  #   assert_equal(["Jim", 50, "Fame", "David Bowie", 30], @bar1.return_bar_tab_array(@guest))
  # end

  # def test_can_update_bar_tab
  #   @bar1.update_bar_tab(@guest1, @drink )
  #   assert_equal(12, @bar1.get_bar_tabs(@guest1))
  # end
end
