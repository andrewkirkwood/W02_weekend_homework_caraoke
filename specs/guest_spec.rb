require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../drink')


class TestGuest < Minitest::Test
  def setup
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie", 20)
    @drink = Drink.new("Beer", 2, 10)
  end

  def test_can_get_guest_name
    assert_equal("Jim", @guest1.name)
  end

  def test_can_get_guest_wallet
    assert_equal(50, @guest1.wallet)
  end

  def test_can_deduct_guest_wallet
    assert_equal(40, @guest1.deduct_guest_wallet(10))
  end

  def test_can_get_guest_favourite_song_name
    assert_equal("Fame", @guest1.favourite_song_name)
  end

  def test_can_get_guest_favourite_song_artist
    assert_equal("David Bowie", @guest1.favourite_song_artist)
  end

  def test_can_get_bar_tab
    assert_equal(20, @guest1.bar_tab)
  end
  def test_can_update_bar_tab
    @guest1.update_bar_tab(@drink)
    assert_equal(22, @guest1.bar_tab)

  end
end
