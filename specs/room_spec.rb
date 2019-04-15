require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup()
    @song1 = Song.new("Billy Jean")
    @song2 = Song.new("Dirty Diana")

    @guest1 = Guest.new("Bob")
    @guest2 = Guest.new("Diane")

    song_list1 = [@song1]
    song_list2 = [@song1, @song2]
    guests1 = []
    guests2 = [@guest1, @guest2]

    @room1 = Room.new(guests1, song_list1, 2)
    @room2 = Room.new(guests2, song_list2, 4)
  end

  def test_there_are_guests_in_room
    assert_equal([], @room1.guests)
  end

  def test_guests_can_be_moved
    @room1.guests = ["Dave"]
    @room2.guests = []
    assert_equal([], @room2.guests)
    assert_equal(["Dave"], @room1.guests)
  end

  def test_there_are_songs_in_room
    assert_equal([@song1], @room1.song_list)
  end

  def test_songs_can_be_edited_to_room
    @room1.song_list = ["Beat It"]
    @room2.song_list = []
    assert_equal(["Beat It"], @room1.song_list)
    assert_equal([], @room2.song_list)
  end

  def test_if_room_has_a_limit
    assert_equal(2, @room1.room_limit)
  end

  def test_check_in_guests_to_room
    assert_equal([@guest1], @room1.check_in_guests(@guest1))
  end

  def test_check_out_guest_from_room
    assert_equal([@guest1], @room2.check_out_guest(@guest2))
  end

  def test_songs_can_be_added_to_room
    assert_equal([@song1, @song2, "Smooth Criminal"], @room2.add_song_to_room("Smooth Criminal"))
  end

  # def test_number_of_guests_in_room
  #   assert_equal(0, @room1.number_of_guests_in_room)
  # end
  #
  # def test_if_room_has_reached_maximum_capacity
  #   assert_equal(true, @room1.is_room_full(@room1))
  # end
end
