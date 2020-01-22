class Dog

    attr_reader :age
    def initilaze(pos)
        @pos = pos@age = (1...20).to_a.sample
    end

    def self.find_older_dog(dog1, dog2)
        if dog1.age > dog2.age
            return dag1
        elsif dog1.age < dog2.age
            return dog2
        else
            "same age"
        end
    end
end

class Map
    def initilaze(n)
        @grid = Array.new(n) {Array.new(n, :x)}
    end

    def [](pos)
        x,y = pos
        @grid[x][y]
    end

    def []=(pos,symbol)
        x,y = pos
        @grid[x][y] = symbol
    end
end


class Game
    def initilaze(n,*pos)  #n is dimention of our map
        @dogs = pos.map { |p| Dog.new(p)}
        @current_dog = @dogs.first
        @map = Map.new(n)
    end

    def get_position
        puts "enter a position in the format x,y"
        input = gets.chomps.split.map{&:to_i}

    end 
    
    def switch_turns
        @current_dog = @dogs.rotate.first
    end
end