# RB101
# Exercises
# easy 6

=begin
# exercise 1
# problem
# given a floating point number that represents an angle
# return the equivalent degrees, minutes, seconds
# formatted as %(30°00'00")

# algorithm
# num converted to integer returns the number of degrees
# save as degrees
# (num minus degrees) * 60 -> convert to i -> mins
# ((num minus degrees) * 60 - minutes) * 60 -> convert to i -> secs
# format the return value as follows: 
# degrees + DEGREE + format("%02d:%02d", min, sec)


DEGREE = "\xC2\xB0"

def dms(num)
  degrees = num.to_i
  mins = ((num - degrees) * 60).round(2).to_i
  secs = ((((num - degrees) * 60) - mins) * 60).round(2).to_i
  %(#{degrees}#{DEGREE}#{format("%02d'%02d", mins, secs) + '"'})
end


# test cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# exercise 2
# problem
# given an array containing a string of characters and spaces, remove the vowels, and
# return an array containing the string with the vowels removed

# algorithm
# assign the string to a variable called return_str
# iterate through the vowels (upper and lower case), deleting characters in return_str
# that match the vowels
# return the return_str in an array

# VOWELS = %w(a e i o u A E I O U)

# def remove_vowels(array)
#   return_array = []
#   array.each do |word|
#     VOWELS.each do |vowel|
#       word = word.delete(vowel)
#     end
#     return_array << word
#   end
#   return_array
# end

# using map
def remove_vowels(array)
  array.map { |word| word.delete('aeiouAEIOU') }
end

# test cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# exercise 3
# problem
# given an integer, return the index of the first number in the Fibonacci 
# sequence which has the integer quantity of numbers (digits)

# algorithm
# initialize a counter variable to 3
# assign first_num = 1 and second_num = 1
# start a loop
# find the next Fib number
# curr_fib = first_num + second_num
# find the length of curr_fib (curr_fib.to_s.length)
# if the length is >= number passed in
  # return counter
# else increment counter
# first_num = second_num and second_num = curr_fib
# continue until a counter value is returned

def find_fibonacci_index_by_length(num)
  counter = 3
  first_num = 1
  second_num = 1
  loop do
    curr_fib = first_num + second_num
    return counter if curr_fib.to_s.length >= num
    counter += 1
    first_num, second_num = second_num, curr_fib
  end
end


# test cases
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# exercise 4
# problem
# given an array, reverse the elements of the array
# return the array itself, mutated
# cannot use reverse or reverse! methods

# algorithm
# start with index = 1, go up to and including length / 2
# swap first and last elements (index = 1)
# array[index - 1], array[-index] = array[-index], array[index - 1]
# index += 1
# swap second and second to last elements (index = 2)
# array[index - 1], array[-index] = array[-index], array[index - 1]

def reverse!(array)
  1.upto(array.length / 2) do |index|
    array[index - 1], array[-index] = array[-index], array[index - 1]
  end
  array
end

# test cases
list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
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

# exercise 5
# problem
# given an array, return the list of items in the array in reverse order
# cannot modify the array object that was passed in

# algorithm
# initialize a new variable new_arr = []
# iterate from -1..array.length (call this index)
# add item at the index to the new_arr
# return new_arr

def reverse(array)
  (1..array.length).each_with_object([]) do |index, new_arr|
    new_arr << array[-index]
  end
end

# test cases
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# exercise 6
# problem
# given two arrays, merge the elements together into one array
# remove duplicates

# algorithm
# add the two arrays together and then call uniq to only include unique elements

def merge(array1, array2)
  (array1 + array2).uniq
end

# test case
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# exercise 7
# problem
# given an array, split it up into two subarrays
# with half the elements in the first subarray and the second half
# of the elements in the second subarray
# if the array length is odd then include the middle element in the first subarray

# algorithm
# find the half way index, array.length / 2 = half_idx
# for an even array:
  # subarray1 = array[0, half_idx]
  # subarray2 = array[half_idx, half_idx]
# for an array with odd number of elements:
  # subarray1 = array[0, half_idx + 1]
  # subarray2 = array[half_idx + 1, half_idx]
# return [subarray1, subarray2]

def halvsies(array)
  half_idx = array.length / 2
  array.length.even? ? end_first_idx = half_idx : end_first_idx = half_idx + 1
  subarray1 = array[0, end_first_idx]
  subarray2 = array[end_first_idx, half_idx]
  [subarray1, subarray2]
end

# test cases
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# exercise 8
# problem
# given an array with exactly one value repeated twice, return 
# that value

# algorithm
# iterate through the unique value in the array
# count the number of times that value occurs in the array
# return the value if the count is greater than zero

def find_dup(array)
  array.uniq.select { |elem| array.count(elem) > 1 }.first
end


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

# exercise 9
# problem
# given an array of values and a value, check to see if the value
# is included in the array without using the include? method

# algorithm
# iterate through the array, checking to see if the value being iterated on 
# equals the value that was passed in
# if the values are equal at any point then return true
# else return false

def include?(array, value)
  array.each do |elem|
    return true if elem == value
  end
  false
end


# test cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
=end

# exercise 10
# algorithm
# num is the number passed in
# for a given line:
# line_num runs from 1 through num
# calculate the number of spaces (num - line_num)
# calculate the number of asterisks (line_num)
# output ' ' * spaces + '*' * asterisks

def triangle(num)
  1.upto(num) do |line_num|
    spaces = ' ' * (num - line_num)
    asterisks = '*' * line_num
    puts "#{spaces}#{asterisks}"
  end
end

triangle(5)

triangle(9)