require "byebug"

def my_min(arr)
  start = 0
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |i2|
      if arr[i] < arr[i2] && arr[i] < start
        start = arr[i]
      end
    end
  end
  start
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def my_min2(arr)
  start = 0
  for i in (0...arr.length)
    start = arr[i] if start > arr[i]
  end
  start
end

def sub_sums2(arr)
  new = []
  for i in (0...arr.length)
    for j in (i...arr.length)
      new << arr[i..j]
    end
  end

  sum_array = []
  new.each do |sub_arr|
    count = 0
    sub_arr.each do |ele|
      count += ele
    end
    sum_array << count
  end

  start = 0
  for i in (0...sum_array.length)
    start = sum_array[i] if start < sum_array[i]
  end
  start
end



def sub_sums(arr)
  largest = arr[0]
  current = 0
 
  (0...arr.length).each do |i|
    current += arr[i]
    if current > largest
      largest = current 
    end

    if arr[i] > largest
      current = arr[i]
      largest = arr[i]
    end
  end
  largest
end

list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p sub_sums(list1)
p sub_sums(list2)