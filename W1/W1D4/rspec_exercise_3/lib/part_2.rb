

def element_count(arr)
    counter = Hash.new(0)

    arr.each do |ele|
        counter[ele] += 1
    end

    counter
end

def char_replace!(str, counter) 
    
    
    (0...str.length).each do |i| 
        if counter.has_key?(str[i]) 
           str[i] = counter[str[i]] 
        end  
     end

     return str
    
end

def product_inject(arr)
    arr.inject { |acc, num| acc * num }
end