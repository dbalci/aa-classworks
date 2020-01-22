require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)  # [R,B,Y,R]
    end

    def print_matches(guess)
        p @secret_code.num_exact_matches(guess)
        p @secret_code.num_near_matches(guess)
    end
    
    def ask_user_for_guess
        p "Enter a code"
        user_guess = Code.from_string(gets.chomp)
        print_matches(user_guess) 
        user_guess ==  @secret_code
    end
end
