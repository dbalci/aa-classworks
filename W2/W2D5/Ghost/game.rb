require "set"
require_relative "player.rb"

class Game
    attr_accessor :current_player, :previous_player 

    def initialize(player1, player2)
        @player1 = Player.new(player1)
        @player2 = Player.new(player2)
        @fragment = ""
        file_data = File.read("dictionary.txt").split("\n")
        @dictionary = Set.new(file_data)
    end

    def play_round
        # until valid guess

        # 1) X  get input from player -> return input 
        # 2) X  valid_play?(input)
        # 3) X  if invalid, valid_play raises error 
        # 4) X  If valid true, add string to fragment 

        input = @current_player.guess

        if valid_play?(input)
            @fragment += input
        end


    end

    def current_player
        @dictionary.each do |word|
            if word.start_with?(@fragment) 
                next_player!
            end
        end
    end

    def previous_player
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    def take_turn(player)
    end

    def valid_play?(string)     #going tpo return true or false
        alpha = ("a".."z").to_a
        round_fragment = @fragment + string 

        if alpha.include?(string) 
            return @dictionary.any? {|word| word.start_with?(round_fragment) && word != round_fragment }
        else
            raise "NOT A VALID LETTER >:O"
        end
    end
end