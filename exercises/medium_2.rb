# RB101
# Exercises
# medium_2.rb

require "date"

=begin
# problem 1
# retains the punctuation /(?<=[?.!])/
# removes the punctuation /\.|\?|!/
# def find_long_sent(file_name)
#   file_data = File.read(file_name)
#   p file_data
#   sentences = file_data.split(/(?<=[?.!])/)
#   sorted_sent = sentences.sort_by do |sentence|
#     sentence.split(' ').length
#   end
#   long_num_words = sorted_sent.last.split(' ').count
#   puts "The longest sentence is: #{sorted_sent.last.strip} and it has #{long_num_words} words."
# end

# file_name = 'long_sent.txt'
# find_long_sent(file_name)

# longest paragraph
def find_long_para(file_name)
  file_data = File.read(file_name)
  paragraphs = file_data.split("\n\n")
  sorted_paras = paragraphs.sort_by do |paragraph|
    paragraph.split(' ').length
  end
  long_num_words = sorted_paras.last.split(' ').count
  puts "The longest paragraph is: '#{sorted_paras.last.strip}' and it has #{long_num_words} words."
end

file_name = 'long_sent.txt'
find_long_para(file_name)

# longest word
def find_long_word(file_name)
  file_data = File.read(file_name)
  file_data_no_dashes = file_data.gsub('--', ' ')
  words = file_data_no_dashes.split(' ')
  words_cleansed = words.map do |word|
    word.gsub(/[^a-zA-Z0-9]/, '')
  end
  longest_word = words_cleansed.max_by { |word| word.length }
  puts "The longest word is: '#{longest_word}' and it has #{longest_word.length} characters."
end

file_name = 'letter.txt'
find_long_word(file_name)

# problem 2
BLOCK_LETTERS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'],
                 ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], 
                 ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], 
                 ['Z', 'M']].freeze

def block_word?(str)
  counter = 0
  letter_arr = []
  loop do
    curr_letter = str[counter].upcase
    BLOCK_LETTERS.each do |arr|
      letter_arr << arr if arr.include?(curr_letter)
    end
    counter += 1
    break if counter == str.length 
  end
  letter_arr == letter_arr.uniq
end

# test cases
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# problem 3
def letter_percentages(str)
  lower = 0
  upper = 0
  neither = 0
  chars_arr = str.chars
  
  lower = chars_arr.count { |char| char =~ /[a-z]/ }
  upper = chars_arr.count { |char| char =~ /[A-Z]/ }
  neither = chars_arr.count { |char| char =~ /[^a-zA-Z]/ }

  lower_pct = ((lower/str.length.to_f) * 100).round(1)
  upper_pct = ((upper/str.length.to_f) * 100).round(1)
  neither_pct = ((neither/str.length.to_f) * 100).round(1)
  { lowercase: lower_pct, uppercase: upper_pct, neither: neither_pct }
end

p letter_percentages('abcdefGHI') 

# test cases
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# problem 4
# true conditions 
# must have pairs
# must be in the right order
# ()
# (())
# ()()
# (()())

# examine the first paren
# if it's ) then false
# count pairs (open and close), if unequal then false


# false conditions
# matched number of start and end but in wrong order
# )( 
# mismatched number of start and end parens
# ())

# def balanced?(str)
#   bal_flg = true
#   paren_arr = str.chars.select { |char| char =~ /[()]/ }
#   bal_flg = false if paren_arr.first == ')' || paren_arr.count('(') != paren_arr.count(')') || paren_arr.last == '('                                     
#   bal_flg
# end

# further exploration
def balanced?(string)
  parens_brack = 0
  quotes = 0
  string.each_char do |char|
    parens_brack += 1 if char =~ /[({\[]/
    parens_brack -= 1 if char =~ /[)}\]]/
    quotes += 1 if char =~ /['"]/
    break if parens_brack < 0 
  end

  parens_brack.zero? && quotes.even?
end

# test cases
# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# new test cases
p balanced?('What {{is)}} up{') == false
p balanced?('Testing "quotes"') == true
p balanced?("Liz's apostrophe will fail") == false

# problem 5
# input is 3 separate integers
# output is one of four symbol values: :equilateral, :isosceles, :scalene, or :invalid

# requirements and rules
# valid triangle is one in which the following are true:
# each side is greater than 0
# the sum of the two smaller sides > the longest side

# equilateral has equal length sides
# isosceles has two sides of equal length, one of a different length
# scalene has all three sides of differing lengths

# check to see if the triangle has valid lengths
# if any of the values is zero then :invalid
# if the sum of the two shorter sides is <= longest side then :invalid
# if all three integers are the same value then :equilateral
# if two of the three integers are the same value then :isosceles
# else :scalene

def triangle(s1, s2, s3)
  tri_arr_sort = [s1, s2, s3].sort
  largest_side = tri_arr_sort.last
  if tri_arr_sort[0..1].sum <= largest_side || tri_arr_sort.include?(0)
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
p triangle(1, 3, 4) == :invalid
p triangle(3, 1, 1) == :invalid

# problem 6
# input: three integers representing the angles of a triangle
# output: a symbol indicating whether the triangle is :acute, :right, :obtuse, or :invalid

# requirements / rules
# return :invalid if either of these conditions is met:
# sum of the 3 input angles must be 180
# none of the input angles can be 0

# if the triangle is valid then:
# return :right if one angle of the triangle is 90
# return :acute if all three angles are less than 90 degrees
# return :obtuse if one angle is greater than 90 degrees

def triangle(angle1, angle2, angle3)
  angle_arr = [angle1, angle2, angle3]
  if angle_arr.sum != 180 || angle_arr.include?(0)
    :invalid
  elsif angle_arr.include?(90)
    :right
  elsif angle_arr.all? { |num| num < 90 }
    :acute
  else
    :obtuse
  end
end

# test cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# problem 7
def friday_13th(year)
  count = 0
  (1..12).each do |month|
    count += 1 if Time.new(year, month, 13).friday?
  end
  count
end

# test cases
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# further exploration
# count the number of number of months that have 5 Fridays
#2020 was a leap year
#2008 was a leap year and had 5 Fridays in February
# 5 Friday conditions
# 1 - 8 - 15 - 22 - 29 (works for all months except Feb unless it's a leap year)
# 2 - 9 - 16 - 23 - 30 (works for all months except Feb)
# 3 - 10 - 17 - 24 - 31 (works for months with 31 days)

# months with 31 days
# 1, 3, 5, 7, 8, 10, 12

# months with 30 days
# 4, 6, 9, 11

# iterate over each month
# calculate the first Friday of that month
# if its any day other than 1, 2, or 3, then continue to the next month
# if the first Friday falls on 1
# if the month is February and not a leap year then continue to the next month
# else increment the counter by 1
# if the first Friday falls on 2
# if the month is February then continue to the next month
# else increment the counter by 1
# if the first Friday falls on 3
# if the month is 2, 4, 6, 9, 11 then continue to the next month
# else increment the counter by 1

def five_fridays(year)
  counter = 0
  months_not_31 = [2, 4, 6, 9, 11]
  (1..12).each do |month| 
    first_fri = (1..7).select { |day| Time.new(year, month, day).friday? }[0]
    case first_fri
    when 1
      next if month == 2 && !Date.leap?(year)
      counter += 1
    when 2
      next if month == 2
      counter += 1
    when 3
      next if months_not_31.include?(month)
      counter += 1
    else
      next
    end
  end
  counter
end

p five_fridays(2022) == 4
p five_fridays(2020) == 4
p five_fridays(2008) == 4
p five_fridays(2027) == 5

# problem 8
# input: integer
# output: integer

# problem: Given an integer, return the next featured number
# greater than the argument

# rules / requirements
# definition of a featured number is:
# - odd
# - a multiple of 7
# - does not have any repeated digits
# There are no featured numbers over 9,999,999,999

# pseudocode
# if the number passed is >= 9,999,999,999, then return
# a message:
# 'There is no possible number that fulfills those requirements'
# initialize a variable test_num to the input integer plus 1
# start loop here
# test to see if test_num is a featured number
# if it is a featured number then return test_num
# else increment test_num by 1
# end loop here

# test if it is a featured number
# initialize a variable to feat_num = false
# check to see if it is odd, if it is then continue
# check to see if it is divisible by 7, if it is then continue
# check to see if all digits are unique, if so then set feat_num = true

# def feat_num?(num)
#   feat_num_ind = false
#   num_arr = num.to_s.chars
#   if num.odd? && num % 7 == 0 && num_arr.length == num_arr.uniq.length
#     feat_num_ind = true 
#   end
#   feat_num_ind
# end

# def featured(num)
#   if num >= 9_999_999_999
#     return 'There is no possible number that fulfills those requirements' 
#   else
#     test_num = num + 1
#     loop do
#       return test_num if feat_num?(test_num)
#       test_num += 1
#     end
#   end
# end

# second attempt after seeing solution
def featured(num)
  test_num = num + 1
  test_num += 1 until test_num.odd? && test_num % 7 == 0
  
  loop do
    num_arr = test_num.to_s.chars
    return test_num if num_arr.length == num_arr.uniq.length
    test_num += 14
    break if test_num >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements'
end

# test cases
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# problem 9
# input: array
# output: array

# sort the array using bubble sort
# array can be an array of strings or an array of integers
# the sort algorithm will mutate the array that is passed in

# pseudocode
# set a variable counter to 0
# set a variable swap = false
# start outer loop here
# initialize two variables which will serve as the index references
# item_1_idx - this will be initialized to 0
# item_2_idx - this will be initialized to 1
# start inner loop here
# use the two index variables to select the items
# item_1 = array[item_1_idx]
# item_2 = array[item_2_idx]
# compare the two items using <==>
# if the return value is 1 then 
# - swap the two values
# - set the variable swap to true
# else do not swap
# increment item_1_idx by 1
# increment item_2_idx by 1
# break out of the inner loop if item_2_idx == array.length
# return the array if swap == false
# increment the counter variable by 1
# break if counter == array.length

# pseudocode from Wiki
# procedure bubbleSort(A : list of sortable items)
#     n := length(A)
#     repeat
#         swapped := false
#         for i := 1 to n - 1 inclusive do
#             if A[i - 1] > A[i] then
#                 swap(A[i - 1], A[i])
#                 swapped := true
#             end if
#         end for
#         n := n - 1
#     until not swapped
# end procedure

def bubble_sort!(array)
  arr_len = array.length
  loop do
    swap = false
    1.upto(arr_len - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = 
        array[index], array[index - 1]
      swap = true
    end
    break unless swap
    arr_len -= 1
  end
  nil
end

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

# problem 10
# def sum_square_difference(int)
#   sum_nums = (1..int).inject { |sum, n| sum + n }
#   sum_sqs = (1..int).inject { |sum, n| sum + n**2 }
#   sum_nums**2 - sum_sqs
# end

# # test cases
# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150
