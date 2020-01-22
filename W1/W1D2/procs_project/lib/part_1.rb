
def my_map(arr, &prc)

    new_arr =[]

    arr.each do |el|
        new_arr << prc.call(el)
    end

    new_arr
end

def my_select(arr, &blc)

    new_arr = []

    arr.each do |el|
        if blc.call(el) == true
        new_arr << el
        end
    end

    new_arr
end

def my_count(arr, &prc)

    counter = 0 

    arr.each do |el|
        if prc.call(el) == true
            counter +=1
        end
    end

    counter
end

def my_any?(arr, &prc)
    
    #at least one element should be true to return true
    #if all prc.call(el) false return false

    true_counter = 0
    false_counter = 0

    arr.each do |el|
        if prc.call(el) == true
            true_counter += 1
        else
            false_counter += 1

        end
    end

    if true_counter >= 1
        return true
    end

    if false_counter == arr.length
        return false
    end

end

def my_all?(arr, &prc)

    true_counter = 0
    false_counter = 0

    arr.each do |el|
        if prc.call(el) == true
            true_counter += 1
        else 
            false_counter += 1
        end
    end

    if true_counter == arr.length
        return true
    elsif false_counter >= 1
        return false
    end

end

def my_none?(arr, &prc)

    true_counter = 0
    false_counter = 0

    arr.each do |el|
        if prc.call(el) == true
            true_counter += 1
        else 
            false_counter += 1
        end
    end

    if false_counter == arr.length
        return true
    elsif true_counter >= 1
        return false
    end

end

def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)

    new_str = ""

    str.split(" ").each do |word|
        new_str += prc.call(word) + " "
    end
    new_str[0...-1] ####joinle yapmaya bak
end

def greater_proc_value(num, prc1, prc2)

    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end

end


def and_selector(arr, prc1, prc2)

    new_arr = []

    arr.each do |el|
        if prc1.call(el) == true and prc2.call(el) == true
            new_arr << el
        end
    end

    new_arr
end


def alternating_mapper(arr, prc1, prc2)

    new_arr = []

    #even with prc1 
    #odd with prc2

    arr.each.with_index do |el,i|
        if i.even? == true
            new_arr << prc1.call(el)
        else
            new_arr << prc2.call(el)
        end
    end

    new_arr
end