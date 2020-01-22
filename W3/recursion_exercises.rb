

def range(start, end_num)
    return [] if end_num <= start
    range(start, end_num - 1) << end_num - 1
end

# p range(1, 5)
 
def exponentiation(b,n)
    return 1 if n == 0
    return b if n == 1 
    b * exponentiation(b, n - 1)
end

# p exponentiation(5,3)   #125
# p exponentiation(2,4)   #16
# p exponentiation(3,3)   #27


def exponentiation2(b,n)
    return 1 if n == 0
    return b if n == 1 
    if b.even?
        exponentiation2(b, n / 2) ** 2
    else
        b * (exponentiation2(b, (n - 1) / 2) ** 2)
    end

end


# p exponentiation2(5,3)   #125
# p exponentiation2(2,256)   #115792089237316195423570985008687907853269984665640564039457584007913129639936
# p exponentiation2(3,3)   #27



class Array

    def dup
        new_arr = []
        self.each do |el|
            unless el.is_a?(Array)
                new_arr << el
            else
                new_arr += el.dup
            end
        end
        new_arr
    end
end

# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
#     ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def iFibonacci(n)
    fib = [1, 1]
    
    while fib.length < n
        fib << fib[-1] + fib[-2]
    end
    
    fib
end

def rFibonacci(n)
    raise "Error" if n <= 0
    return [1] if n == 1
    return [1, 1] if n == 2

    fib = rFibonacci(n - 1)
    fib << fib[-1] + fib[-2]
end

# p rFibonacci(5)
# p iFibonacci(5)

# p rFibonacci(3)
# p iFibonacci(3)


def bsearch(arr, target)
    return nil if arr.empty?
    return nil if !arr.include?(target)

    mid = arr.length / 2
    if arr[mid] == target
        return mid
    elsif arr[mid] < target
        mid + 1 + bsearch(arr[mid+1..-1],target)
    else
        bsearch(arr[0...mid],target)   
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1until
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


require "byebug"

def merge(arr_1, arr_2)
    new_arr = []
    until arr_1.empty? || arr_2.empty?
        if arr_1[0] >= arr_2[0]
            new_arr << arr_2.shift
        else
            new_arr << arr_1.shift
        end
    end
    new_arr += arr_1 + arr_2
end

def merge_sort(arr)
    mid = arr.length / 2
    return arr if arr.empty?
    return arr if arr.length == 1
    return merge(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))
end

# p merge_sort([1,2,7,83,5,1,0,56])
# p merge_sort([3,5,2,8,6])
# p merge_sort([0,0,0,2,3,1])
# p merge_sort([2, 1, 5, 8, 3, 0])


def subsets(arr)
    return [arr] if arr.empty?
    result = subsets(arr[0...-1])
    arr.each_with_index do |ele_1, idx_1|
        arr.each_with_index do |ele_2, idx_2|
            if idx_2 > idx_1
                result << [ele_2]
                result << [ele_1, ele_2]
            end
        end
    end
    result << arr
    result.uniq
end
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. 
# This allows each coin to be available each time we get a new remainder. 
# By iterating over the denominations and continuing to search for the best change, 
# we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. 
# This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders.
#If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. 
# Then go back and refactor your solution so that it only calculates and compares all of the different combinations. 
# If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.