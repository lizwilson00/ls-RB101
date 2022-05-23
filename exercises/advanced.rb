# RB101
# Exercises
# advanced.rb

# exercise 1
# word_hash = {}
# puts "Enter 4 adjectives separated by spaces:"
# word_hash[:adjectives] = gets.chomp.split.shuffle
# # funny hungry sore grumpy
# puts "Enter 4 nouns separated by spaces:"
# word_hash[:nouns] = gets.chomp.split.shuffle
# # trail book dog mom
# puts "Enter 4 verbs separated by spaces:"
# word_hash[:verbs] = gets.chomp.split.shuffle
# # steals skips snorts opens
# puts "Enter 4 adverbs separated by spaces:"
# word_hash[:adverbs] = gets.chomp.split.shuffle
# # easily fearlessly sleepily noisily

word_hash = { adjectives: %w(funny hungry sore grumpy),
              nouns: %w(trail book dog mom),
              verbs: %w(steals skips snorts opens),
              adverbs: %w(easily fearlessly sleepily noisily) }

# file_data = File.read('madlibs.txt')
# words = file_data.split
# madlibs_arr = words.map do |word|
#   if word.include?('%{adjective}') 
#     word_hash[:adjectives].shift
#   elsif word.include?('%{noun}')
#     word_hash[:nouns].shift
#   elsif word.include?('%{adverb}')
#     word_hash[:adverbs].shift
#   elsif word.include?('%{verb}')
#     word_hash[:verbs].shift
#   else
#     word
#   end
# end
# p madlibs_arr.join(' ')

# using format
File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, adjective: word_hash[:adjectives].shift,
                      noun:      word_hash[:nouns].shift,
                      adverb:    word_hash[:adverbs].shift,
                      verb:      word_hash[:verbs].shift)
  end
end

=begin
# exercise 2
# line 0 (middle) display the input number of stars
# line 1 (above and below the middle) display:
  # (input - 3)/2 spaces 
  # 3 consecutive stars (0 spaces in between)
  # (input - 3)/2 spaces 
# line 2 display
  # (input - 5)/2 spaces
  # star 
  # space (1 space in between)
  # star
  # space
  # star
  # (input - 5)/2 spaces
# line 3 display
  # space (if not last line)
  # star
  # (input - 5)/2 spaces
  # star
  # (input - 5)/2 spaces
  # star
  # space (if not last line)
# line 3 display

# method to print the row depending on the distance from the center
# iterate "down" to the center
# print the center row
# iterate "up" from the center

def print_row(grid_size, dist_from_center)
  star_spaces = ' ' * (dist_from_center - 1)
  stars = '*' + star_spaces + '*' + star_spaces + '*'
  puts stars.center(grid_size)
end

def star(size)
  (size/2).downto(1) do |line_num|
    print_row(size, line_num)
  end
  puts "*" * size
  1.upto(size/2) do |line_num|
    print_row(size, line_num)
  end
end

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# exercise 3
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# input: array of nested arrays
# output: array of nested arrays
# initialize a new array with empty nested arrays
# same length as the initial passed in array
# iterate through each array within the array
# iterate through each item of the array
# add the first item of each array to the first array 
# in the new array variable
# add the second item of each array to the second array
# and so forth

# def transpose(matrix)
#   trans_matrix = matrix.map { |array| array.dup }
#   matrix.each_with_index do |array, row|
#     array.each_with_index do |num, col|
#       trans_matrix[col][row] = num
#     end
#   end
#   trans_matrix
# end 

# using the logic from the solution

def transpose(matrix)
  trans_matrix = []
  (0..matrix.length - 1).each do |col_idx|
    new_row = (0..matrix.length - 1).map do |row_idx|
      matrix[row_idx][col_idx]
    end
    trans_matrix << new_row
  end
  trans_matrix
end

# def transpose!(matrix)
#   (0..matrix.length - 1).each do |row_idx|
#     (row_idx + 1..matrix.length - 1).each do |col_idx|
#       matrix[col_idx][row_idx], matrix[row_idx][col_idx] = matrix[row_idx][col_idx], matrix[col_idx][row_idx]
#     end
#   end
#   matrix
# end

# new_matrix = transpose!(matrix)

# p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# exercise 4
# transpose a matrix of any size, including non-square matrices
# initialize a new variable trans_matrix
# save the number of rows as a variable (matrix length)
# save the number of columns as a variable (length of the 1st element of matrix)
# iterate through each row
  # iterate through each element of each row
    # check to see if the transposed element exists 
      # if it does then do the usual swap
      # if not then assign the element to that position
      # swapping the row and column indexes
# return trans_matrix

def transpose(matrix)
  trans_matrix = []
  num_rows = matrix.length
  num_cols = matrix[0].length
  (0..num_cols - 1).each do |col_idx|
    new_row = (0..num_rows - 1).map do |row_idx|
      matrix[row_idx][col_idx]
    end
    trans_matrix << new_row
  end
  trans_matrix
end

# test cases
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# problem 5
# def rotate90(matrix)
#   trans_matrix = []
#   num_rows = matrix.length
#   num_cols = matrix[0].length
#   (0...num_cols).each do |col_idx|
#     new_row = (0...num_rows).to_a.reverse.map do |row_idx|
#       matrix[row_idx][col_idx]
#     end
#     trans_matrix << new_row
#   end
#   trans_matrix
# end

# further exploration
def rotate90(matrix, rotation = 90)
  counter = rotation / 90
  trans_matrix = []
  loop do
    trans_matrix = []
    num_rows = matrix.length
    num_cols = matrix[0].length
    (0...num_cols).each do |col_idx|
      new_row = (0...num_rows).to_a.reverse.map do |row_idx|
        matrix[row_idx][col_idx]
      end
      trans_matrix << new_row
    end
    matrix = trans_matrix
    counter -= 1
    break if counter == 0
  end
  trans_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1, 360)
new_matrix2 = rotate90(matrix2, 360)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 # == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 # == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# problem 6
def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# problem 7
# make a copy of both arrays
# initialize a new empty array, new_array
# set a counter equal to the length of both arrays added together
# find the length of both arrays
# test to see if the first element of the first array is smaller
# than the first element of the second array
# if it is then add it to new_array
# if it is NOT smaller then add the first element of the other array
# to the new_array array
# remove the element from the array
# check to see if the first element of either array is the same as the 
# last element in the new_array
# if either is the same then move it to the new_array 

# def merge(arr1, arr2)
#   total_len = arr1.length + arr2.length
#   counter = 0
#   new_array = []
#   arr1_copy = arr1.dup
#   arr2_copy = arr2.dup
#   loop do
#     # check if one of the arrays is empty?
#     if arr1_copy.empty?
#       new_array << arr2_copy
#       break
#     elsif arr2_copy.empty?
#       new_array << arr1_copy
#       break
#     end
#     # pairwise comparison
#     if arr1_copy.first <= arr2_copy.first
#       new_array << arr1_copy.shift
#     else 
#       new_array << arr2_copy.shift
#     end
#     counter += 1
#     break if counter == total_len
#   end
#   new_array.flatten
# end

# after seeing solution
def merge(array1, array2)
  index2 = 0
  result = []
  array1.each do |arr1_val|
    while index2 < array2.length && array2[index2] <= arr1_val
      result << array2[index2]
      index2 += 1
    end
    result << arr1_val
  end
  result.concat(array2[index2..-1])
end

# test cases
# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]

# problem 8
# merge sort
# write a method that creates two subarrays
# from one array with each subarray containing 
# half the number of elements from the original array

# pseudocode
# procedure mergesort( var a as array )
#    if ( n == 1 ) return a

#    var l1 as array = a[0] ... a[n/2]
#    var l2 as array = a[n/2+1] ... a[n]

#    l1 = mergesort( l1 )
#    l2 = mergesort( l2 )

#    return merge( l1, l2 )
# end procedure

def merge_sort(array)
  return array if array.length == 1
  sub_size = array.length / 2
  
  sub1 = array[0...sub_size]
  sub2 = array[sub_size..-1]
  
  sub1 = merge_sort(sub1)
  sub2 = merge_sort(sub2)

  return merge(sub1, sub2)
end


# how it should work
# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

# test cases
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# problem 9


# test cases
def egyptian(rational_num)
  solution = []
  denom = 1
  loop do
    if (rational_num - Rational(1, denom)).zero?
      solution << denom
      return solution
    elsif rational_num - Rational(1, denom) > 0
      solution << denom
      rational_num -= Rational(1, denom)
      denom += 1
    elsif rational_num - Rational(1, denom) < 0
      denom += 1
    end
  end
  solution
end

def unegyptian(array)
  array.inject(0) { |sum, n| sum + Rational(1, n) }.to_r
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
=end
