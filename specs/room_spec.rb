require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')

class TestRoom < Minitest::Test

  def setup()
    @room1 = Room.new("The Cave", 50)
  end

  def test_get_room_name
    assert_equal("The Cave", @room1.name)
  end

  def test_get_room_capacity
    assert_equal(50, @room1.capacity)
  end
end
