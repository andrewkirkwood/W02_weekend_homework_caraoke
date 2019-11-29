class Room

  attr_reader :name, :capacity, :guests_in_room

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests_in_room = []
  end

  def check_guest_in(guest)
    @guests_in_room.push(guest.name)
  end


end
