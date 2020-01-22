
class Board

    attr_reader :grid
    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    
    def valid?(pos) 
        row,col = pos
        pos.all? {|num| num >= 0 && num < @n}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end
    
    def empty?(pos)
        row, col = pos
        @grid[row][col] == "_"
    end
    
    def place_mark(pos, mark)

        if valid?(pos) && empty?(pos)
            self[pos] = mark
            return mark
        else 
            raise "invalid mark"
        end

    end

    def legal_positions
        legal_pos = []
        for x in (0...@n)
            for y in (0...@n)
                if @grid[x][y] == "_"
                    legal_pos << [x,y]
                end
            end
        end

        legal_pos

    end

    def print
       @grid.each do |row|
        puts row.join(" ")
       end
    end

    def row_win?(mark)
        @grid.any? do |row|
            row.uniq.length == 1 && row.uniq.include?(mark)
        end
    end

    def col_win?(mark)
        @grid.transpose.any? do |row|
            row.uniq.length == 1 && row.uniq.include?(mark)
        end
    end

    def diagonal_win?(mark)
        ltr = []    #[00, 11, 22]
        rtl = []    #[02, 11, 20]

        @grid.each.with_index do |row,r|
            row.each.with_index do |col, c|
                if r == c
                    ltr << col
                end

                if (row.length - 1 -r == c)
                    rtl << col
                end
            end
        end

        ltr_con = ltr.uniq.length == 1 && ltr.uniq.include?(mark)
        rtl_con = rtl.uniq.length == 1 && rtl.uniq.include?(mark)

        ltr_con || rtl_con
    end


    def win?(mark)
        row_win?(mark) || col_win?(mark) || diagonal_win?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|pos| pos == "_"}
    end
end     
