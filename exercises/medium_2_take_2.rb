# RB101
# Exercises
# medium_2_take_2.rb

=begin
# exercise 1
def longest_sent(file_name)
  file_data = File.read(file_name)
  sentences = file_data.split(/(?<=[?.!])/)
  max_sent = sentences.max_by do |sent|
    sent.split(' ').length
  end
  p max_sent.strip
  puts "Word count: #{max_sent.split(' ').count}"
end

file = 'letter.txt'
longest_sent(file)

# exercise 2
# problem: 
# check to see if a word is spelled from characters
# which are contained in different blocks
# rules: 
# characters in the same word cannot contain two letters 
# contained in the same block
# algorithm must allow for upper and lower case letters
# each block can only be used once

# input: string
# output: boolean

# data structure:
# nested array with each block represented as a subarray

# algorithm:
# iterate through each of blocks
# iterate through each character of the block
# if both characters are included in the word then return false
# else continue to the next block
# if all blocks have been checked, then return true

BLOCKS = [['B','O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G','T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(string)
  string = string.upcase
  return false if string.chars.map { |char| string.count(char) }.sort.last > 1
  BLOCKS.each do |block|
    return false if block.all? do |char|
      string.include?(char)
    end
  end
  true
end

# test cases:
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('BATCHB') == false

# exercise 3

# def letter_percentages(string)
#   result = {}

#   string.each_char do |char|
#     case_key = if char =~ /[A-Z]/ then ":uppercase"
#               elsif char =~ /[a-z]/ then ":lowercase"
#               else ":neither"
#               end
#     if result.has_key?(case_key)
#       result[case_key] += 1
#     else
#       result[case_key] = 1
#     end
#   end
#   result.each { |key, val| result[key] = (val / string.length.to_f ) * 100 }
#   # result
# end

# refactored
def letter_percentages(string)
  result = {}
  str_arr = string.chars

  result[:lowercase] = str_arr.count { |char| char =~ /[a-z]/ }
  result[:uppercase] = str_arr.count { |char| char =~ /[A-Z]/ }
  result[:neither] = str_arr.count { |char| char =~ /[^a-zA-Z]/ }

  result.each { |key, val| result[key] = (val / string.length.to_f ) * 100 }
end

# test cases
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# exercise 4
# problem: check to see if the string contains valid parenthesis based on several rules:
# rules:
# cannot start with ) or end with (
# must have equal numbers of ) or ( 

# algorithm:
# select only the '(' and ')' characters from the string
# store them in an array:
# return false if any of the following are true:
  # ')' appears first
  # '(' appears last
  # count of '(' not equal to count of ')'
# else return true

def balanced?(string)
  paren_arr = string.chars.select { |char| char =~ /[()]/}
  if paren_arr.first == ")" || paren_arr.last == "(" || paren_arr.count("(") != paren_arr.count(")")
    return false
  end
  true
end

# test cases
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# exercise 5
# identify the type of triangle based on the three lengths passed in
# input: 3 numbers
# output: :equilateral, :isosceles, :scalene, or :invalid based on the rules

# rules:
# return :invalid if one or more numbers passed in <= 0
# return :invalid if the sum of the two shortest sides <= length of the longest side
# return :equilateral if all 3 numbers are the same
# return :isosceles if two numbers are the same
# else return :scalene

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  small_sides = sides[0..1]
  if sides.first <= 0 || small_sides.sum <= sides.last
    :invalid 
  elsif s1 == s2 && s2 == s3
    :equilateral 
  elsif s1 == s2 || s2 == s3 || s1 == s3
    :isosceles
  else
    :scalene
  end
end


# test cases
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# exercise 6
# problem
# given three triangle angles, return whether the triangle is
# :acute, :right, :obtuse, or :invalid based on the rules

# rules
# right: one angle is 90 degrees
# acute: all three angles are less than 90 degrees
# obtuse: one angle is greater than 90 degrees
# invalid if either of these is true: 
  # sum of the angles not equal to 180 degrees
  # any of the input angles equal to 0

def triangle(a1, a2, a3)
  angles = [a1, a2, a3].sort

  if angles.sum != 180 || angles.include?(0)
    :invalid
  elsif angles.last == 90 
    :right
  elsif angles.last > 90
    :obtuse
  else
    :acute
  end
end

# test cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# exercise 7
# problem:
# given a year, return the number of Friday the 13ths

# initialize a variable num_fridays to 0
# iterate from 1 through 12, passing in this value as the month
# check to see if the day of the week for the 13th that month was a Friday
# if it is a Friday then increment num_fridays by 1

def friday_13th(year)
  num_fridays = 0
  1.upto(12) do |month|
    num_fridays += 1 if Time.local(year, month, 13).friday?
  end
  num_fridays
end


# test cases
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# exercise 8
# problem:
# given a number, return the next featured number based on the following rules

# feature number rules:
# must be odd
# must be divisible by 7
# digits can only occur once
# there are no feature numbers > 9_999_999_999 (since would have repeat digit)

# algorithm
# return "no solution" if num >= 9_999_999_999
# initialize a variable guess to the number passed in + 1
# check to see if the number is divisible by 7
  # if it isn't divisible by 7 then increment guess by 1
  # once the number is found then move to the next set of steps

# check to see if the number is odd
  # if it is odd then check to see if the digits are unique
    # if the digits are unique then return the number
    # else increment the variable guess by 7
  # if it isn't odd then increment guess by 7

def featured(num)
  return "no solution" if num >= 9_876_543_201
  guess = num + 1
  until guess % 7 == 0
    guess += 1
  end
  loop do
    return guess if guess.odd? && guess.to_s.chars.uniq == guess.to_s.chars
    guess += 7
  end
end

# test cases
# p featured(12) #== 21
# p featured(20) #== 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
p featured(9_876_543_201) == "no solution"
p featured(9_999_999_999) == "no solution" # -> There is no possible number that fulfills those requirements

# exercise 9
# algorithm for bubble sort:
# procedure bubbleSort(A : list of sortable items)
#     n := length(A)
#     repeat
#         swapped := false
#         for i := 1 to n-1 inclusive do
#             /* if this pair is out of order */
#             if A[i-1] > A[i] then
#                 /* swap them and remember something changed */
#                 swap(A[i-1], A[i])
#                 swapped := true
#             end if
#         end for
#     until not swapped
# end procedure

def bubble_sort!(array)
  arr_len = array.length
  loop do
    swapped = false
    (1...arr_len).each do |idx|
      if array[idx - 1] > array[idx]
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        swapped = true
      end
    end
    break if swapped == false
  end
  nil
end


# test cases
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
=end

# exercise 10
# problem:
# given a number, n, return the difference between the square of the sum
# of the first n positive integers and the sum of the squares of the 
# first n positive integers

# iterate from 1 to n (inclusive)
# calculate the running sum of these integers and square it (save as sq_sum)
# calculate the square of each of these integers and sum them (save as sum_sq)
# return the difference between these sq_sum - sum_sq

def sum_square_difference(num)
  sq_sum = (1.upto(num).inject(0) { |sum, n| sum + n })**2
  sum_sq = 1.upto(num).inject(0) { |sum, n| sum + (n**2) }
  sq_sum - sum_sq
end


# test cases
p sum_square_difference(3) #== 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150