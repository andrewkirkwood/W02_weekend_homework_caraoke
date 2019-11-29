require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup()
    @room1 = Room.new("The Cave", 50)
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie")
    # @guest2 = Guest.new("Ed", 50, "Fame", "David Bowie")

  end

  def test_get_room_name
    assert_equal("The Cave", @room1.name)
  end

  def test_get_room_capacity
    assert_equal(50, @room1.capacity)
  end

  def test_can_check_guest_into_room__gets_name
    @room1.check_guest_in(@guest1)
    assert_equal(["Jim"], @room1.guests_in_room)
  end

end
