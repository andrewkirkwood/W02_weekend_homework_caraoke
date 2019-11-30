require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')

class TestBar < Minitest::Test

  def setup
    @bar1 = Bar.new("Room1_bar")
  end

  def test_get_bar_name
    assert_equal("Room1_bar", @bar1.bar_name)
  end

end
