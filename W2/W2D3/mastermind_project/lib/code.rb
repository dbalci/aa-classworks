class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

    def self.valid_pegs?(arr)
      arr.all? {|ele| POSSIBLE_PEGS.has_key?(ele.upcase) }
    end

    def initialize(pegs)
      if Code.valid_pegs?(pegs)
        @pegs = pegs.map{|peg| peg.upcase}
      else
        raise "Error"
      end
    end

    def self.random(length)
      random = []
      length.times {random << POSSIBLE_PEGS.keys.sample}
      Code.new(random)
    end

    def self.from_string(pegs)
      Code.new(pegs.split(""))
    end

    def [](idx)
      @pegs[idx]
    end

    def length
      @pegs.length
    end

    def num_exact_matches(guess)
      count = 0
      (0...guess.length).each do |i|
        if guess[i] == self[i]
          count += 1
        end
      end
      count
    end


    def num_near_matches(guess)
      count = 0
      (0...guess.length).each do |i|
        if self.pegs.include?(guess[i]) and guess[i] != self[i]
          count += 1
        end
      end
      count
    end

    def ==(other_code)
      self.pegs == other_code.pegs
    end
end
