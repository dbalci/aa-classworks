class Game
        
    require "./board.rb"
    require "./human_player.rb"
    # Game
    # The Game class will be the main class that houses the instances of Board and 
    # HumanPlayer required for gameplay.
    # It will be responsible for passing data between the board and players.
    # It will also serve to contain the main game loop.

    # Be sure to require your board.rb and human_player.rb files into game.rb.

    # Game#initialize(player_1_mark, player_2_mark)
    # An instance of Game should have instance variables for player one, player two, and the board.
    # Design the #initialize method to accept the mark values to be used for the players.

    # You should also initialize an instance variable to contain the current player.
    # By default, player one should begin as the current player.
  # Game#switch_turn
    # This method should set the current player to the other player.
    # Calling this method repeatedly should switch the current player back and forth between the two players.
    # This method is critical for gameplay so be sure to test it in pry.
    # Here is how our switching mechanic performs:

    def initialize(n, *player_mark)
        @n = n
        @num_of_marks = player_mark.length
        #player_mark = [o , x, u]
        
        @players = player_mark.map! do |mark|
            HumanPlayer.new(mark)
        end
        @current_player = @players[0]
        @board = Board.new(n)
        
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while  @board.grid.flatten.any? {|el| el == "_"}
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "victory for #{@current_player.mark}"
                return 
            else
                self.switch_turn
            end
        end
        p "draw"
    end

    # [1] pry(main)> load 'game.rb'
    # => true

    # [2] pry(main)> game = Game.new(:X, :O)
    # => #<Game:0x0
    #  @current_player=#<HumanPlayer:0x @mark=:X>,
    #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
    #  @player_1=#<HumanPlayer:0x @mark=:X>,
    #  @player_2=#<HumanPlayer:0x @mark=:O>>

    # [3] pry(main)> game.switch_turn
    # => #<HumanPlayer:0x @mark=:O>

    # [4] pry(main)> game
    # => #<Game:0x00007f8b5ac725f8
    #  @current_player=#<HumanPlayer:0x @mark=:O>,
    #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
    #  @player_1=#<HumanPlayer:0x @mark=:X>,
    #  @player_2=#<HumanPlayer:0x @mark=:O>>

    # [5] pry(main)> game.switch_turn
    # => #<HumanPlayer:0x @mark=:X>

    # [6] pry(main)> game
    # => #<Game:0x00007f8b5ac725f8
    #  @current_player=#<HumanPlayer:0x @mark=:X>,
    #  @player_1=#<HumanPlayer:0x @mark=:X>,
    #  @player_2=#<HumanPlayer:0x @mark=:O>>
    #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
    # Notice how @current_player changes when we call #switch_turn.
    # With that, we now have all the mechanics needed to put the game together!


    # Game#play
    # This method will contain the main game loop.
    # Here is some psuedocode for the loop:

    # while there exists empty positions on the board
    # print the board
    # get a position from the current player
    # place their mark at that position of the board
    # check if that user has won
    # if they win, print out a 'victory' message saying who won and return to end the game
    # otherwise they did not win, so switch turns
    # if we finish the while loop without returning, 
    #     that means there are no more empty positions on the board and noone has won, 
    #     so print a 'draw' message
    
    
    # Test your game in pry.
    # Play a few games by creating an instance of Game and invoking #play on it.
    # After a game is over, be sure to create a new instance of Game to play again, 
    # this is the only way to get a fresh board.
    # Some scenarios to test are: player one winning, player two winning, and a draw.

    # If any errors are raised during gameplay, your game loop and #play method will end immediately, 
    # so you'll have to start a new game and retry!



end