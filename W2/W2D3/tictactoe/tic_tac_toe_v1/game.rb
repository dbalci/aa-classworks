class Game

    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
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
end