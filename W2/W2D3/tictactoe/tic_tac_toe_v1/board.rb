
class Board

    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(pos) 
        row,col = pos
        pos.all? {|num| num >= 0 and num < 3}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
        # row,col = pos
        # @grid[row][col]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
        # row,col = pos
        # @grid[row][col] = val
    end
    
    def empty?(pos)
        row, col = pos
        @grid[row][col] == "_"
        # self[pos] == "_"
    end

    def place_mark(pos, mark)

        if valid?(pos) and empty?(pos)
            self[pos] = mark
            return mark
        else 
            raise "invalid mark"
        end

    end

    def print
       @grid.each do |row|
        puts row.join(" ")
       end
    end

    def win_row?(mark)
        @grid.any? do |row|
            row.all? {|char| char == mark}
        end
    end

    
    def win_col?(mark)
        @grid.transpose.any? do |row|
            row.all? {|char| char == mark}
        end
    end

    def win_diagonal?(mark)
        ltr_diagonal = []
        rtl_diagonal = []
        @grid.each.with_index do |row,r|
            row.each.with_index do |col,c|
                if r == c 
                    ltr_diagonal << col
                end
                
                if (row.length - r - 1) == c
                    rtl_diagonal << col
                end
            end
        end
        ltr = (ltr_diagonal.uniq.length == 1) && ltr_diagonal.include?(mark) 
        rtl = (rtl_diagonal.uniq.length == 1) && rtl_diagonal.include?(mark)
        ltr || rtl

    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|pos| pos == "_"}
    end

end 