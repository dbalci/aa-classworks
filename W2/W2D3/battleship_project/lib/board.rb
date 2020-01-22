class Board

    attr_reader :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n

    end

    def size    #getter
        @size
    end

    def [](arr)     #getter
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, value)     #setter
        @grid[arr[0]][arr[1]] = value
    end

    def num_ships       #getter
        @grid.flatten.count {|el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end
    
    def place_random_ships
        ships = (@size * 0.25).to_i
        i = 0
        while i < ships
            random_numx = (0...@size**0.5).to_a.sample
            random_numy = (0...@size**0.5).to_a.sample
            if @grid[random_numx][random_numy] != :S
                @grid[random_numx][random_numy] = :S
                i += 1
            end
        end
    end

    def hidden_ships_grid
        n = (@size ** 0.5)
        new_grid = Array.new(n) {Array.new(n)}

        for r in (0...n)
            for c in (0...n)
                if @grid[r][c] == :S 
                    new_grid[r][c] = :N 
                else
                    new_grid[r][c] = @grid[r][c]
                end
            end
        end
        new_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
