        

def is_prime?(number)
    if number < 2 
        return false
    end

    (2...number).each do |ele|
        if number % ele == 0 
            return false
        end
    end
    return true
end

def nth_prime(n)
    arr = []

    i = 2
    while arr.length < n
       arr << i if is_prime?(i)

        i += 1
    end

    arr[-1]
end

def prime_range(min,max)

    arr = []

    (min..max).each do |ele|
        arr << ele if is_prime?(ele)
        # if you are using one line code if, you dont need to put end
    end
    arr
end