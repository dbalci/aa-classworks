# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)

    num1Factors = factor(num_1)
    num2Factors = factor(num_2)

    counter = 0

    num1Factors.each do |eli|
        num2Factors.each do |val|
            if eli == val
                counter += 1           
            end
        end
    end
    
    return counter > 1 ? false : true
end

def factor(n)
    divisors = []

    (1..n/2 + 1).each do |num|
        if n % num == 0
            divisors << num
        end
    end

    return divisors
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
