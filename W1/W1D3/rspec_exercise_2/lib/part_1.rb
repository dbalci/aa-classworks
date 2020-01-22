
def partition(array,n)
    less_than = []
    greather_than = []
    array.each do |num|
        if num < n
            less_than << num
        else
            greather_than << num
        end
    end
    return [less_than, greather_than]
end

def merge(hash_1, hash_2)
    hash_3 = Hash.new(0)

    hash_1.each do |k1, v1|
        hash_2.each do |k2, v2|
            if k1 == k2 
                hash_3[k2] = v2
            else
                hash_3[k1] = v1
                hash_3[k2] = v2
            end
        end
    end
    return hash_3
end

def censor(sentence, arr) 
    vowels = "aeiou"
    words = ""
    sentence.split(" ").each do |word|
        new_str = ""
        if arr.include?(word.downcase)
            word.each_char do |char|
                if vowels.include?(char.downcase)
                    new_str += "*"
                else
                    new_str += char
                end
            end
            words += new_str + " "
        else
            words += word + " "
        end
    end
    words[0...-1]
end

def power_of_two?(num) # num = 8
    if num < 1
        return false
    end

    powers = [1]
    while powers[-1] < num  # 1,2,4,8 num = 8
        powers << powers[-1] * 2
    end

    if powers.include?(num)
        return true
    else
        false
    end

end

