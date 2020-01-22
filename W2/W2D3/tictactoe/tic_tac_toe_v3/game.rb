class Game
        
    require "./board.rb"
    require "./human_player.rb"

    def initialize(n, player_hash)
        @n = n

        @players = player_hash.map do |k, v|
            if v == false
                HumanPlayer.new(k)
            else
                ComputerPlayer.new(k)
            end
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
            p "------------"
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?(@current_player.mark)
                p "victory for #{@current_player.mark}"
                @board.print
                return 
            else
                self.switch_turn
            end
        end
        p "draw"
    end
end