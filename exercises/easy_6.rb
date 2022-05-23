# RB101
# easy 6

=begin
# problem 1
DEGREE = "\xC2\xB0"

def dec_value(float)
  (float - float.truncate).round(6)
end

def dms(degrees)
  deg = degrees.truncate
  mins = (dec_value(degrees) * 60)
  mins_trunc = mins.truncate
  secs = (dec_value(mins) * 60).truncate
  format(%(#{deg}#{DEGREE}%02d'%02d"), mins_trunc, secs)
end

# use cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# still need to work on the further exploration (values > 360 and < 0)

# problem 2
# remove vowels
VOWELS = 'aeiouAEIOU'

def remove_vowels(array)
  array.map do |string|
    string.delete(VOWELS) 
  end
end

# test cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# problem 3
# my first attempt
# this does not work well with any integer larger than 7
# def fib(n)
#   return n if (0..1).include?(n)
#   (fib(n - 1) + fib(n - 2))
# end
# # puts fib(2)

# # p fib(7).to_s.length

# def find_fibonacci_index_by_length(int)
#   counter = 2
#   until fib(counter).to_s.length == int
#     counter += 1
#   end
#   counter
# end

# after looking at the solution
def find_fibonacci_index_by_length(num_digits)
  first_num = 1
  second_num = 1
  index = 2

  loop do
    index += 1
    fib = first_num + second_num
    break if fib.to_s.length >= num_digits
    
    first_num = second_num
    second_num = fib
  end

  index
end

p find_fibonacci_index_by_length(100)

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# problem 4

def reverse!(array)
  counter = 0
  arr_len = array.length
  while counter < arr_len
    first_elem = array.shift
    array.insert(arr_len - counter - 1, first_elem)
    counter += 1
  end
  array
end

# test cases
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

# problem 5 
# reverse, part 2
# my solution
# def reverse(array)
#   new_array = []
#   array.each do |elem|
#     new_array = [elem] + new_array
#   end
#   new_array
# end

# do the same thing but use each_with_object
def reverse(array)
  array.each_with_object([]) do |elem, new_array|
    new_array.unshift(elem)
  end
end

# p reverse(%w(a b e d c))

# test cases
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# problem 6
# merge and dedupe
# def merge(arr_1, arr_2)
#   new_array = (arr_1 + arr_2).uniq
# end

# can also use union (|)
def merge(arr_1, arr_2)
  arr_1 | arr_2
end

# test case
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# problem 7
# my attempt
# def halvsies(array)
#   arr_len = array.length
#   arr_1_len = arr_len / 2
#   arr_1_len += 1 if arr_len.odd?
#   new_array = [array[0..(arr_1_len - 1)]] + [array[arr_1_len..(arr_len - 1)]]
# end


# using slice
def halvsies(array)
  arr_1_len = (array.length / 2.0).ceil
  first_arr = array.slice(0, (arr_1_len))
  second_arr = array.slice(arr_1_len, (array.length))
  [first_arr, second_arr]
end

p halvsies([1, 2, 3, 4])

# test cases
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# problem 8
# my solution
# def find_dup(array)
#   dup_array = array.select do |elem|
#     array.count(elem) == 2
#   end
#   dup_array[0]
# end

# further exploration
def find_dup(array)
  work_arr = []
  array.each do |elem|
    if work_arr.include?(elem)
      return elem
    else
      work_arr << elem
    end
  end
end

# p find_dup([1, 5, 3, 1])

# test cases
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# problem 9
# def include?(array, val)
#   array.each { |el| return true if el == val }
#   false
#   # array.member? (val)
# end


def include?(array, value)
  !!array.find_index(value)
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)

# test cases
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false
=end

# problem 10
# triangles
# my solution
# def triangle(num)
#   counter = 1
#   while counter <= num 
#     puts " " * (num - counter) + ("*" * counter)
#     counter += 1
#   end
# end

# using the solution's methodology
# def triangle(num)
#   spaces = num - 1
#   stars = num - spaces

#   num.times do |n|
#     puts (" " * spaces) + ("*" * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

# modifying to display upside down
# def triangle(num)
#   spaces = 0
#   stars = num

#   num.times do |n|
#     puts (" " * spaces) + ("*" * stars)
#     spaces += 1
#     stars -= 1
#   end
# end

# upper left right triangle
# def triangle(num)
#   spaces = 0
#   stars = num

#   num.times do |n|
#     puts ("*" * stars) + (" " * spaces)
#     spaces += 1
#     stars -= 1
#   end
# end

# bottom left right triangle
def triangle(num)
  spaces = num - 1
  stars = num - spaces

  num.times do |n|
    puts ("*" * stars) + (" " * spaces)
    spaces -= 1
    stars += 1
  end
end

triangle(9)
