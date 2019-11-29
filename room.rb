class Room

  attr_reader :name, :capacity, :guests_in_room

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests_in_room = []
  end

end
