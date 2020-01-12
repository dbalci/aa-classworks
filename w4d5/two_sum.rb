def two_sum?(arr,target)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |i2|
      return true if arr[i] + arr[i2] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
require "byebug"
def okay_two_sum?(arr, target)

  arr.sort!
  arr.each do |el|
    wanted = target - el
    m = arr.length / 2
    mid = arr[m]

    return m if mid == wanted

    left = arr[0...m]
    right = arr[m+1..-1]

    okay_two_sum?(left, target)
    result = okay_two_sum?(right, target)
    if result.nil?
      return nil
    else
      m + 1 + result
    end
  end
  

end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false