

def proper_factors(num)

    factors = []

    (1...num).each do |factor|
       factors << factor if num % factor == 0
    end
    
    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end


def ideal_numbers(n)
    ideals = []

    i = 1
    while ideals.length < n
        ideals << aliquot_sum(i) if perfect_number?(i) 
        i += 1
    end

    ideals
end
