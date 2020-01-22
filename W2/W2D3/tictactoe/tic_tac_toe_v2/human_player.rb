    # HumanPlayer
    # The HumanPlayer class is responsible for holding information about the user and prompting them to enter a position for gameplay.
class HumanPlayer

    # HumanPlayer#initialize(mark_value)
    # We'll allow a player to use any mark they like, so an instance of HumanPlayer should have a instance variable to store their mark.
    # The value of this mark should be provided as an argument when creating a new player.
    # Consider adding a getter method for the player's mark, this may be useful later!
    
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end
    # HumanPlayer#get_position
    # This method should prompt and allow the user to enter a valid row col position.
    # We recommend that you ask the user to enter the position as two numbers with a space between them.
    # Your method should return their entered position as an array of the form [row, col] so 
    # that it is compatible with the design of our previous Board methods.
    # For usability, raise an error when they fail to enter a position in the specified format, 
    # such as if they only enter a single number, use letters, or have too many spaces.
    # No need to verify if the position they entered is a valid position in this class.
    # That validation requires knowledge of the board and we want to keep our concerns separated.
    # Besides, you previously implemented that logic in Board#valid? and Board#empty?.
    # It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.
 
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



    # Checkpoint - Test often, we're only human after all
    # This is a great time to test your work! Load your HumanPlayer class into pry and test it.
    # Here is how we tested our player:

    # [1] pry(main)> load 'human_player.rb'
    # => true

    # [2] pry(main)> player_1 = HumanPlayer.new(:X)
    # => #<HumanPlayer:0x @mark=:X>

    # [3] pry(main)> player_1.mark
    # => :X

    # [4] pry(main)> player_1.get_position
    # Player X, enter two numbers representing a position in the format `row col`
    # 0 2
    # => [0, 2]

    # [5] pry(main)> player_1.get_position
    # Player X, enter two numbers representing a position in the format `row col`
    # 12 4
    # => [12, 4]

    # [6] pry(main)> player_1.get_position
    # Player X, enter two numbers representing a position in the format `row col`
    # 1 2 3
    # RuntimeError: sorry, that was invalid :(
    # Before you move on, double check that your Player#get_position returns an array of numbers, 
    # and not an array of strings.
    # This will save you a ton of headaches later!

end