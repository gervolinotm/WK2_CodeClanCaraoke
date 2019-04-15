class Room

  attr_reader :room_limit
  attr_accessor :guests, :song_list
  def initialize(guests, song_list, room_limit)
    @guests = guests
    @song_list = song_list
    @room_limit = room_limit
  end

  def check_in_guests(guest_name)
    @guests.push(guest_name)
  end

  def check_out_guest(guest_name)
    @guests.find_all { |guest|
    if guest == guest_name
    @guests.delete(guest_name)
    end
    }
    return @guests
  end

  def add_song_to_room(song_name)
    @song_list.push(song_name)
  end

  # def number_of_guests_in_room
  #   return @guests.length
  # end
  #
  # def is_room_full(room)
  #   return true if number_of_guests_in_room() == room.room_limit
  # end
end
