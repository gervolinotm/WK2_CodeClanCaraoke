require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup()
    @song = Song.new("Don't Stop Believing")
  end

  def test_song_has_a_name
    assert_equal("Don't Stop Believing", @song.name)
  end

end
