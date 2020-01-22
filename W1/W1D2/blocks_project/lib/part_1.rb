

def select_even_nums(arr)
    arr.select(&:even?)
end



def reject_puppies(dogs)
    dogs.reject {|dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count do |subarr|
        subarr.sum > 0
    end
end

def aba_translate(word)
    vovels= "aeiou"
    outputword = ""

    word.each_char do |char|
        if vovels.include?(char)
            outputword += char + "b" + char
        else
            outputword += char
        end
    end


    return outputword
end

def aba_array(arr)
    arr.map { |str| aba_translate(str)  }
end