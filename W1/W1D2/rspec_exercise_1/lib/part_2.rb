

def hipsterfy(str)

    arr = []
    
    str.split(" ").each do |word|
        reversed = vowel_remover(word.reverse)
        arr << reversed.reverse
    end

    arr.join(" ")

end

def vowel_remover(word)

    new_word = ""
    word.each_char.with_index do |char,i|
        if "aeiou".include?(char)
            new_word += word[i+1..-1]
            break
        else
            new_word += char
        end
    end
    new_word

end


def vowel_counts(str)

    counter = Hash.new(0)
    vovels = "aeiou"

    str.each_char do |char|
        if vovels.include?(char.downcase)
            counter[char.downcase] +=1
        end
    end
    return counter
end

def caesar_cipher(str,num)

    alp = Array("a".."z")
    new_str = ""

    str.each_char do |el|
        if alp.include?(el)
            new_str += alp[(alp.index(el) + num) % alp.length]
        else
            new_str += el
        end
    end
    return new_str
end