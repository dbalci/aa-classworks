class Flight

    require "passenger.rb"

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        return if self.full?
        
        if passenger.has_flight?(@flight_number)    
            @passengers << passenger
        end
    end

    def list_passengers
        list = []
        @passengers.each do |passenger|
            list << passenger.name
        end
        list
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end
