class Hangman

    attr_reader :guess_word
    attr_accessor :attempted_chars, :remaining_incorrect_guesses

    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def initialize
        @secret_word = Hangman.random_word
        @guess_word = Array.new(@secret_word.length , "_")
        @attempted_chars = []
        @remaining_incorrect_guesses = 5
    end

    def self.random_word
        DICTIONARY.sample
    end

    def guess_word
        @guess_word
    end

    def attempted_chars
        @attempted_chars
    end

    def already_attempted?(char)
        @attempted_chars.include?(char)
    end

    def get_matching_indices(char)

        return [] if !@secret_word.include?(char)

        pos = []
        if @secret_word.include?(char)
            @secret_word.each_char.with_index do |el,i|
                pos << i if @secret_word[i] == char
            end
        end
        pos 

    end


    def fill_indices(char, arr)

        @guess_word.each.with_index do |el,i|
            if arr.include?(i)
                @guess_word[i] = char
            end
        end
    end

    def try_guess(char)
        if already_attempted?(char)
            p "that has already been attempted"
            return false
        else
            @attempted_chars << char
            if !@secret_word.include?(char)
                @remaining_incorrect_guesses -= 1
            else
                fill_indices(char, get_matching_indices(char))
            end
            return true
        end
    end

    def ask_user_for_guess

        p "Enter a char:"
        char = gets.chomp
        return try_guess(char)
    end

    def win?

        # if @guess_word.join("") == @secret_word
        #     puts "WIN"
        #     return true
        # else
        #     return false
        # end

        winner = @guess_word.join("") == @secret_word
        p "WIN" if winner
        return winner
    end

    def lose?
        # if @remaining_incorrect_guesses == 0
        #     p "LOSE"
        #     return true
        # else
        #     return false
        # end

        p "LOSE" if @remaining_incorrect_guesses == 0
        return @remaining_incorrect_guesses == 0
    end


    def game_over?
        
        # if win? || lose?
        #     p @secret_word
        #     return true
        # else
        #     return false
        # end

        game_over = win? || lose?
        p @secret_word if game_over
        return game_over
    end

   
end
