class Room

  attr_reader :name, :capacity, :guests_in_room, :playlist, :entry_fee

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @guests_in_room = []
    @playlist = []
    @entry_fee = entry_fee
  end

  def check_guest_in(guest)
    if @guests_in_room.length >= @capacity
      return "Sorry, there is no more capacity here"
    elsif @guests_in_room.length <= @capacity
      @guests_in_room.push(guest)
    end
  end

  def check_guest_out(guest)
    @guests_in_room.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def delete_song_from_playlist(song)
    @playlist.delete(song)
  end

  def check_guest_has_enough_for_entry_fee(guest)
    return true if guest.wallet > @entry_fee
    return true if guest.wallet == @entry_fee
    return false if guest.wallet < @entry_fee
  end
end
