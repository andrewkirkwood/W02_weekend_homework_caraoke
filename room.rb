class Room

  attr_reader :name, :capacity, :guests_in_room, :playlist

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests_in_room = []
    @playlist = []
  end

  def check_guest_in(guest)
    @guests_in_room.push(guest.name)
  end

  def check_guest_out(guest)
    @guests_in_room.delete(guest.name)
  end


end
