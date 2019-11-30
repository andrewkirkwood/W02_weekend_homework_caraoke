require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')


class TestRoom < Minitest::Test

  def setup()
    @room1 = Room.new("The Cave", 3, 5)
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie")
    @guest2 = Guest.new("Ed", 2, "Fame", "David Bowie")
    @guest3 = Guest.new("John", 5, "Fame", "David Bowie")
    @song1 = Song.new("Fame", "David Bowie")
    @song2 = Song.new("Regular John", "Queens of The Stone Age")

  end

  def test_get_room_name
    assert_equal("The Cave", @room1.name)
  end

  def test_check_room__available_capacity
    assert_equal(3, @room1.capacity)
  end

  def test_check_guests_in_room__adds_2_guests
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    assert_equal(2,@room1.guests_in_room.length)
  end

  def test_check_room_is_empty
    assert_equal(0, @room1.guests_in_room.length)
  end

  def test_check_playlist_is_empty
    assert_equal(0, @room1.playlist.length)
  end

  def test_check_till_amount_is_0
    assert_equal(0, @room1.till_amount)
  end

  def test_check_guest_in_checks_number_of_guests
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest2)
    @room1.check_guest_in(@guest3)
    assert_equal(2, @room1.guests_in_room.length)
  end

  def test_check_guest_in__adds_too_many_guests_returns_guests_in_room_equals_capacity
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    assert_equal(@room1.capacity,@room1.guests_in_room.length)
  end

  def test_can_check_guest_in__adds_too_many_guests_returns_guests_in_room_returns_string
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    assert_equal("Sorry, there is no more capacity here", @room1.check_guest_in(@guest1))
  end

  def test_check_guest_in__checks_room_till_goes_up
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest3)
    assert_equal(15, @room1.till_amount)
  end

  def test_check_guest_in__guest_does_not_have_enough_money
    @room1.check_guest_in(@guest2)
    assert_equal(0, @room1.guests_in_room.length)
  end

  def test_can_check_out_guest_from_room
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest3)
    @room1.check_guest_out(@guest1)
    assert_equal(1, @room1.guests_in_room.length)
  end

  def test_can_add_song_to_room_playlist__checks_length
    @room1.add_song_to_playlist(@song1)
    assert_equal(1, @room1.playlist.length)
  end

  def test_can_delete_song_from_room_playlist
    @room1.add_song_to_playlist(@song1)
    @room1.delete_song_from_playlist(@song1)
    assert_equal(0, @room1.playlist.length)
  end

  def test_check_guest_has_enough_money_to_pay_for_entry__returns_true
    assert_equal(true, @room1.check_guest_has_enough_for_entry_fee(@guest1))
  end

  def test_check_guest_has_enough_money_to_pay_for_entry__returns_true_again
    assert_equal(true, @room1.check_guest_has_enough_for_entry_fee(@guest3))
  end

  def test_check_guest_has_enough_money_to_pay_for_entry__returns_false
    assert_equal(false, @room1.check_guest_has_enough_for_entry_fee(@guest2))
  end

  def test_check_favorite_song_matches_playlist__returns_woo
    @room1.add_song_to_playlist(@song1)
    assert_equal("woo", @room1.check_favorite_song_matches_playlist(@guest1))
  end

  def test_check_favorite_song_matches_playlist__returns_sorry_no_match
    @room1.add_song_to_playlist(@song2)
    assert_equal("sorry, no match", @room1.check_favorite_song_matches_playlist(@guest1))
  end

end
