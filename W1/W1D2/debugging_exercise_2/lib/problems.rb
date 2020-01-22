# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    if prime?(num)
        return num
    end

    (num-1).downto(2).each do |factor|
        if prime?(factor) && num % factor == 0
            return factor
        end
    end
end

def prime?(num)
    if num <2 
        return false
    end
    
    (2...num).none? {|factor| num % factor == 0 }
end

def unique_chars?(str)
    if str.split("").uniq == str.split("")
        return true
    end
    false
end


def dupe_indices(arr)
    
    dupes = Hash.new {|dupes , k| dupes[k]= []}

    arr.each.with_index do |el,i|
        dupes[el] << i
    end
    
    dupes.each do |k,v|
        if v.length == 1
            dupes.delete(k)
        end
    end
end

def ana_array(arr1,arr2)

    arr1_counter = Hash.new(0)
    arr2_counter = Hash.new(0)

    arr1.each do |char|
        arr1_counter[char] +=1
    end

    arr2.each do |char|
        arr2_counter[char] +=1
    end

    if arr1_counter == arr2_counter
        return true
    end
    return false
end