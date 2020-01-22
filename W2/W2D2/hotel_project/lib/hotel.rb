require_relative "room"

class Hotel

    attr_accessor :rooms

    def initialize(name, rooms)
        room_hash = Hash.new
        rooms.each {|k,v| room_hash[k] = Room.new(v)}
        @name = name
        @rooms = room_hash
    end

    def name
        @name.split
             .map {|word| word.capitalize}
             .join(" ")
    end 

    def room_exists?(room_name)
        @rooms.has_key?(room_name)  
    end
    
    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        else
            puts 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.any? {|room, cap| !@rooms[room].full? }
    end

    def list_rooms
        @rooms.each {|k,v| puts "#{k}" + v.available_space.to_s}
    end


end

