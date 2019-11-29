require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test
  def setup
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie")
  end

  def test_can_get_guest_name
    assert_equal("Jim", @guest1.name)
  end

  def test_can_get_guest_wallet
    assert_equal(50, @guest1.wallet)
  end

  def test_can_get_guest_favourite_song_name
    assert_equal("Fame", @guest1.favourite_song_name)
  end
end
