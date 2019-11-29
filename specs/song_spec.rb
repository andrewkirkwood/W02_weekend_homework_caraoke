require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Fame", "David Bowie")
  end

  def test_get_song_name
    assert_equal("Fame", @song1.name)
  end

  def test_get_song_artist
    assert_equal("David Bowie", @song1.artist)
  end
end
