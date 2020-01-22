def all_words_capitalized?(arr)
    arr.all? do |word|
        word.capitalize == word
    end
end

def no_valid_url?( arr)
    arr.none? do |url|
        url.end_with?(".com", ".net", ".io",".org")
    end

end

def any_passing_students?(array)

    array.any? do |student|
        grades = student[:grades]
        avarage = grades.sum / grades.length * 1.0
        puts avarage
        if avarage >= 75
            true
        else
            false
        end
    end
end