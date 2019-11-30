require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestBar < Minitest::Test

  def setup
    @drink = Drink.new("Beer", 2, 5)
  end

  def test_get_drink_name
    assert_equal("Beer", @drink.name)
  end

end
