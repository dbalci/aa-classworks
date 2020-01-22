class Room

    attr_reader :capacity
    attr_accessor :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @capacity <= @occupants.length
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name)
        full_house = full?
        @occupants << name if !full_house
        !full_house
    end


end
