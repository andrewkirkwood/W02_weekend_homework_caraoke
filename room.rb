class Room

  attr_reader :name, :capacity, :guests_in_room, :playlist, :entry_fee, :till_amount

  def initialize(name, capacity, entry_fee, till_amount = 0)
    @name = name
    @capacity = capacity
    @guests_in_room = []
    @playlist = []
    @entry_fee = entry_fee
    @till_amount = till_amount
  end

  def check_guest_has_enough_for_entry_fee(guest)
    return true if guest.wallet > @entry_fee
    return true if guest.wallet == @entry_fee
    return false if guest.wallet < @entry_fee
  end

  def check_guest_in(guest)
    if @guests_in_room.length >= @capacity
      return "Sorry, there is no more capacity here"
    elsif check_guest_has_enough_for_entry_fee(guest)
        @guests_in_room.push(guest)
        @till_amount += @entry_fee
        guest.deduct_guest_wallet(@entry_fee)
    elsif check_guest_has_enough_for_entry_fee(guest) == false
      return "sorry, you don't have sufficient funds"
    else
      return "invalid input"
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

  def check_favorite_song_matches_playlist(guest)
    @playlist.each {|song|
      if song.name == guest.favourite_song_name && song.artist == guest.favourite_song_artist
        return "woo"
      else
        return "sorry, no match"
      end
    }
  end

  def sell_drink_to_customer(guest,drink)
    guest.update_bar_tab(drink)
    drink.add_or_remove_drink_stock(-1)
  end
end
