   
class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end
    
    def get_position
        p "enter the position as two numbers with a space between them"
        pos = gets.chomp.split(" ")
        if pos.length != 2
            raise  "Input should be two numbers"
        end
        pos_final = []
        pos.each do |el|
            if el != el.to_i.to_s 
                raise "Not a valid input"
            else
                pos_final << el.to_i
            end 
        end
        pos_final
    end
end