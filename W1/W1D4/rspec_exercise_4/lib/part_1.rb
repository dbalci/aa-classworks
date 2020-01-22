


def my_reject(arr, &prc)
    # prc - object // &prc = block
    newArr = []

    arr.each do |el|
        if prc.call(el) == false 
            newArr << el 
        end

    end

    newArr
end

def my_one?(arr, &prc)

    counter = Hash.new(0)

    arr.each do |ele|
        counter[ele] += 1 if prc.call(ele)
    end

    if counter.keys.length == 1 && counter[counter.keys[0]] == 1
        return true
    end
    
    return false
end

def hash_select(h, &prc)
    
    new_h = {}

    h.each do |key, val|
        if prc.call(key, val)
            new_h[key] = val
        end
    end

    new_h
end

def xor_select(arr, prc1, prc2)
 
    newArr =[]
    result1 = true
    result2 = true
    
    arr.each do |ele|
        result1 = prc1.call(ele)
        result2 = prc2.call(ele)
        newArr << ele if [result1, result2].one? { |el| el == true }
    end

    newArr
end

def proc_count(num, arr)

    count = 0

    # arr = [upcase, ends_exclamation]
    arr.each do |proc1|
        if proc1.call(num) == true
            count += 1
        end
    end
    return count

end