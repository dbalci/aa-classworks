

def average(num1,num2)
    return (num1 + num2)/2.0
end

def average_array(arr)

    total = 0.0
    arr.each do |num|
        total +=num
    end
    return total / arr.length
end

def repeat(str,num)
    i = 0 
    new_str = ""
    while i < num
        new_str += str
        i += 1
    end
    return new_str
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)

    new_str = ""
    str.split(" ").each.with_index do |word,i|
        if i.even?
            new_str += word.upcase + " "
        else
            new_str += word.downcase + " "
        end
    end
    return new_str[0...-1]
end