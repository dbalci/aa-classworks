

def palindrome?(str)

    new_str = ""
    i = str.length - 1
    str.each_char do |char|
        while i >= 0 
            new_str += str[i] 
            i -= 1 
        end
    end
    new_str == str 
end


def substrings(str) 

    new_arr = []

    for i in (0...str.length) do 
        for j in (i...str.length) do 
            new_arr << str[i..j]
        end
    end
    
    return new_arr
end


def palindrome_substrings(str)

    subs = []
    substrings(str).each do |com|
        if palindrome?(com) && com.length > 1
           subs << com
        end
    end
    return subs
end



