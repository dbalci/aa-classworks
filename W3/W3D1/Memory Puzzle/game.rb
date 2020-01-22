require_relative "card"
require_relative "board"

class Game
    attr_reader :board, :guess_pos, :prev_guess

    def initialize
        @board = Board.new
        @board.generate_cards
        @board.populate
        @guess_pos = [] 
        @prev_guess = []   
    end

    def make_guess
        puts 'Make a guess: '
        input = gets.chomp
        pos = input.split(" ").map(&:to_i) 
    end

    def play
        while @board.grid.flatten.any? { |card| !card.face_up }
            @guess_pos = self.make_guess
            @board.reveal(@guess_pos)
            if @prev_guess.length == 0
                @prev_guess = @guess_pos
            else
                self.compare
                @prev_guess = []
            end
            @board.render
            sleep(3)
            system("clear")
        end
    end

    def compare
        card1 = @board[@prev_guess]
        card2 = @board[@guess_pos]
        if !(card1 == card2)
            card1.hide
            card2.hide
        end
    end
end
