

class Player

    def initialize(name)
        @name = name
    end

    def guess
        input = gets.chomp
        if input.length != 1
            alert_invalid_guess 
            return false
        else
            return input
        end
    end

    def alert_invalid_guess
        puts "Invalid guess"
    end





end