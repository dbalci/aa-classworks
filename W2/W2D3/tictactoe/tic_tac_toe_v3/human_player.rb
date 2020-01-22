
class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end
 
    def get_position(legal_positions)
        p "enter the position as two numbers with a space between them"
        pos = gets.chomp.split(" ").map! {|el| el.to_i}
        while !legal_positions.include?(pos)
            pos = gets.chomp.split(" ").map! {|el| el.to_i}
        end
        pos
    end
end