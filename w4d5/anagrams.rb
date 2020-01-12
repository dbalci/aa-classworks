require "byebug"
def first_anagram?(str, target)
  arr = str.split("")
  new_arr = arr.permutation(arr.length).to_a.map do |sub|
    sub.join("")
  end
  # debugger
  new_arr.each do |el|
    return true if el == target
  end
  false
end

str1 = "123"
target = "321"
# p first_anagram?(str1, target)
# p first_anagram?("cijsujaslddjhdahdajkko", "kodfhsdfjgsfjhgaskko")

def second_anagram?(str1,str2)
  str2 = str2.split("")
  str1.each_char do |char|
    i2 = str2.find_index(char)
    str2.delete(i2)
  end
  return true if str2.empty?
  false

end

# p second_anagram?("abc", "victoria")

def third_anagram?(str1,str2)
  str1.split("").sort == str2.split("").sort
end

# p third_anagram?("abc", "bca")

def fourth_anagram?(str1,str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  str1.each_char do |char|
    h1[char] += 1
  end

  str2.each_char do |char|
    h2[char] += 1
  end

  h1 == h2

end

p fourth_anagram?("dog", "dgo")