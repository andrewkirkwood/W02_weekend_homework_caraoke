require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')


class TestRoom < Minitest::Test

  def setup()
    @room1 = Room.new("The Cave", 3)
    @guest1 = Guest.new("Jim", 50, "Fame", "David Bowie")
    @guest2 = Guest.new("Ed", 50, "Fame", "David Bowie")
    @song1 = Song.new("Fame", "David Bowie")

  end

  def test_get_room_name
    assert_equal("The Cave", @room1.name)
  end

  def test_get_room__available_capacity
    assert_equal(3, @room1.capacity)
  end

  def test_get_guests_in_room
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest1)
    assert_equal(2,@room1.guests_in_room.length)
  end

  def test_room_is_empty
    assert_equal(0, @room1.guests_in_room.length)
  end

  def test_playlist_is_empty
    assert_equal(0, @room1.playlist.length)
  end

  def test_can_check_guest_name_into_room
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest2)
    assert_equal(["Jim", "Ed"], @room1.guests_in_room)
  end

  def test_can_check_out_guest_name_from_room
    @room1.check_guest_in(@guest1)
    @room1.check_guest_in(@guest2)
    @room1.check_guest_out(@guest1)
    assert_equal(["Ed"], @room1.guests_in_room)
  end

  def test_can_add_song_to_room_playlist
    @room1.add_song_to_playlist(@song1)
    assert_equal(["Fame"], @room1.playlist)
  end

  def test_can_delete_song_from_room_playlist
    @room1.add_song_to_playlist(@song1)
    @room1.delete_song_from_playlist(@song1)
    assert_equal([], @room1.playlist)
  end
end
