class Hangman
  attr_reader :guess_word
  attr_accessor :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def self.random_word
    DICTIONARY.sample
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    len = @secret_word.length
    (0...len).select {|i| char == @secret_word[i]}
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    attempted = already_attempted?(char)
    if attempted
      puts "that has already been attempted"
    else
      @attempted_chars << char
      indices = get_matching_indices(char)
      count = indices.count {|i| char == @secret_word[i]}
      @remaining_incorrect_guesses -= 1 if count == 0
      fill_indices(char, indices)
    end
    !attempted
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    @guess_word.each_with_index {|c,i| return false if c != @secret_word[i]}
    p "WIN"
    true
  end

  def lose?
    puts "LOSE" if @remaining_incorrect_guesses == 0
    return @remaining_incorrect_guesses == 0
  end

  def game_over?
    endgame = win? || lose?
    puts @secret_word if endgame
    endgame
  end
end



