# Board
# The Board class is responsible for adding a player's marks, checking for winners, 
# and printing the game board.
# A board instance must have an attribute to represent the grid.
# For simplicity, give the grid the dimensions of classic tic-tac-toe, nxn.

#Board
class Board

    #initialize
    # A Board instance must have an instance variable to represent the game grid.
    # For now, Board#initialize does not need to accept any arguments.
    # Initialize the grid so that all positions are empty;
    # this means that every position should contain an underscore ('_').

    attr_reader :grid
    def initialize(n)
        @n = n
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    # Board#valid?(position)
    # This method should return a boolean indicating whether or not the specified position is valid for the board, 
    # meaning the position is not "out of bounds."

    def valid?(pos)         #getter
        #pos shoul be 2 number like [2,n]
        #need to check if [2,n] is in our @grid
        row,col = pos
        pos.all? {|num| num >= 0 && num < @n}
    end

    # Board#empty?(position)
    # This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

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
    
    # Board#place_mark(position, mark)
    # This method should assign the given mark to the specified position of the grid.
    # It should raise an error when the position is not #valid? or not #empty?.

    def place_mark(pos, mark)

        if valid?(pos) && empty?(pos)
            self[pos] = mark
            return mark
        else 
            raise "invalid mark"
        end

    end

    # Checkpoint - Board yet?
    # At this point you've written a few Board methods that are critical to the gameplay.
    # Now's a good opportunity to pause and test our code for correctness.
    # A quick way to test is to use pry.

    # You should cd into the project folder and run pry.
    # Then, use load 'board.rb' to load your code into the environment, 
    # this should return true if the file was successfully loaded.
    # From there, play around with your class by creating an instance and calling some methods on it! 
    # If you edit the file you are going to have to load it into the environment again.

    # Here are a few lines that we executed to test our code, feel free to try your own scenarios:

    # [1] pry(main)> load 'board.rb'
    # => true

    # [2] pry(main)> b = Board.new
    # => #<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>

    # [n] pry(main)> b.place_mark([-1, 2], :X) # this should fail
    # RuntimeError: invalid mark
    # from board.rb:28:in `place_mark'

    # [4] pry(main)> b.place_mark([1, 2], :X)
    # => :X

    # [5] pry(main)> b
    # => #<Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

    # [6] pry(main)> b.place_mark([1, n], :X) # this should fail
    # RuntimeError: invalid mark
    # from board.rb:28:in `place_mark'

    # [7] pry(main)> b.place_mark([0, 0], :O)
    # => :O

    # [8] pry(main)> b
    # => #<Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

    # [9] pry(main)> b.place_mark([0, 0], :X) # this should fail
    # RuntimeError: invalid mark
    # from board.rb:28:in `place_mark'


    # Once you feel confident with your code, move forward.
    # As a programmer, you should test your code often as you write.
    # If you continue to write code on top of broken code, 
    # you may accumulate a deficit of bugs that will be hard to isolate later on.
    # Be methodical! You should be testing your code often, 
    # and not just when we tell you!

    # Board#print
    # This method should simply print out the board and all of the marks that have been placed on it.
    # Feel free to style the printing as much as you'd like, 
    # but be sure to print out each row of the board on a new line.
    # This will help us visualize the board better as we debug or even play the game!

    def print
       @grid.each do |row|
        puts row.join(" ")
       end
    end

    # Board#win_row?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

    def win_row?(mark)
        @grid.any? do |row|
            row.all? {|char| char == mark}
        end
    end

    # Board#win_col?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

    def win_col?(mark)
        @grid.transpose.any? do |row|
            row.all? {|char| char == mark}
        end
    end

    # Board#win_diagonal?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

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

    # Board#win?(mark)
    # This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    # Board#empty_positions?
    # This method should return a boolean indicating whether or not there is at least one empty position on the grid.

    def empty_positions?
        @grid.flatten.any? {|pos| pos == "_"}
    end

    # Checkpoint - You're all winners
    # If you haven't already, take a moment to use pry to test your win-checking logic.
    # Use your #place_mark to set the board up and #print to visually verify any winners.
    # We'll leave it to you to decide reasonable test scenarios.
    # As a rule of thumb for methods with boolean returns, be sure to test for "false-positives" and "false-negatives".
    # In other words, verify that #win? and the related methods return true when they should and return false when they should.
    # Don't forget to test your #empty_positions? method as well!

end 