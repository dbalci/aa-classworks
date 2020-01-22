# Write a method, adult_in_group?(people), that accepts an array containing people.
# The method should return true if there is at least 1 person with an age of 18 or greater.
# The method should return false otherwise.

# make a counter = 0
# access the hashes and iterate the values through the hash
# for every value over 18 => counter increment 1
# return true if counter over 1 else false


def adult_in_group?(people)

    counter= 0 

    people.each do |inf|
        inf.each_value do |val|
            if val.to_i >= 18 
                counter +=1
            end
        end
    end

    return counter >= 1 ? true : false
end

people_1 = [
    {name: "Jack", age: 17},
    {name: "Jill", age: 21},
    {name: "Alice", age: 15},
    {name: "Bob", age: 16}
]


p adult_in_group?(people_1)    # => true

people_2 = [
    {name: "Jane", age: 12},
    {name: "John", age: 13},
    {name: "Ashley", age: 10},
    {name: "Bill", age: 16}
]
p adult_in_group?(people_2)    # => false