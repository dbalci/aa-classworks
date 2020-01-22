require_relative "card"
require "byebug"

class Board
    attr_reader :cards, :grid

    def initialize
        @grid = Array.new(4) { Array.new(4) }
        @size = 16
        @cards = []
    end

    def generate_cards
        values = ("A".."Z").to_a

        letters = []
        while letters.length < (@size/2)
            value = values.sample
            letters << value if !letters.include?(value)
        end
        letters *= 2

        letters.each do |letter|
            @cards << Card.new(letter)
        end
    end

    def populate
        shuffled = @cards.shuffle
        @grid.map! do |row|
            row.map! { |pos| pos = shuffled.pop}
        end
    end

    def render
        display = @grid.map do |row|
            row.map do |pos|
                if pos.face_up
                    pos.value
                else
                    " "
                end
            end
        end
        display.each { |row| puts row.join(" ")}
    end 

    def won?
        @cards.all? {|card| card.face_up}
    end

    def [](pos)
        x,y = pos.map(&:to_i)
        @grid[x][y]
    end


    def []=(pos,val)
        x,y = pos
        @grid[x][y] = val
    end


    def reveal(guessed_pos)
        self[guessed_pos].reveal if !self[guessed_pos].face_up
        self[guessed_pos].value
    end
    
end
