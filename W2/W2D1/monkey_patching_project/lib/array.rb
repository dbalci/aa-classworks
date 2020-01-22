# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        (self.length != 0) ? self.max - self.min : nil
    end

    def average
        sum = self.sum
        (self.length != 0) ? sum.to_f / self.length : nil
    end

def median

        return nil if self.empty?
        arr = self.sort
        middle = self.length/2 - 1
        if self.length.even?
            (arr[middle] + arr[middle + 1] + 0.0) /2
        else
            arr[self.length/2]
        end
    end

    def counts
        count = Hash.new(0)

        self.each {|el| count[el] +=1}
        count
    end

    def my_count(arg)
        count = 0
        self.each do |el|
            if el == arg
             count += 1
            end
        end
        count
    end

    def my_index(str)
        self.each_with_index do |el, i|
            if el == str
                return i
            end
        end
        nil
    end

    def my_uniq
        counter = Hash.new(0)
        self.each do |el|
            counter[el] += 1
        end
        counter.keys
    end

    def my_transpose
        new_arr = []
        self.each_with_index do |rows, r|
            sub_arr = []
            rows.each_with_index do |col, c|
                sub_arr << self[c][r]
            end
            new_arr << sub_arr
        end
        new_arr
    end

end
