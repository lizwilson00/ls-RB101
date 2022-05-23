# RB101
# exercises
# easy_4_take_2.rb

=begin
# exercise 1
# given two unequal length strings, create a new string
# that is a combination of the shortest + longest + shortest

# input: two strings
# output: one string

# examples:
# valid to pass in a blank string, ''

# algorithm
# if str1 is shorter than str2 then
# str1 + str2 + str1
# else
# str2 + str1 + str2

def short_long_short(str1, str2)
  str1.length < str2.length ? str1 + str2 + str1 : str2 + str1 + str2
end

# test cases
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# exercise 2
# problem: given a year, return the century with the 
# appropriate ending (st, nd, rd, th, etc.)
# new centuries start in years that end in 01
# If year ends in 00 then it's the year / 100
# Else it's the (year / 100) + 1
# ending hash is applied if the century is 1, 2, 3
# or if the century ends in 01, 02, 03
# else ending is 'th'

def century(year)
  century, rem = year.divmod(100)
  century += 1 if rem != 0
  last_two_digits = century % 100
  last_digit = century % 10
  case last_digit
  when 1
    last_two_digits == 11 ? century.to_s + 'th' : century.to_s + 'st'
  when 2
    last_two_digits == 12 ? century.to_s + 'th' : century.to_s + 'nd'
  when 3
    last_two_digits == 13 ? century.to_s + 'th' : century.to_s + 'rd'
  else
    century.to_s + 'th'
  end
end

# test cases
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# exercise 3
# problem: given a year, return a boolean indicating whether it is a leap year or not
# rules for it to qualify as a leap year
# year must be evenly divisible by 4, unless the year is also divisible by 100
# if the year is evenly divisible by 100, then it is not a leap year unless it is divisible by 400

# algorithm
# year divisible by 4?
  # if yes, then is it also divisible by 100?
    # if yes, then is it divisible by 400?
      # if yes, then a leap year
      # if no, then not a leap year
    # if no, then not a leap year
  # if no, then a leap year
# if no, then not a leap year

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      year % 400 == 0 ? true : false
    else
      true
    end
  else
    false
  end
end

# test cases
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# exercise 4
def leap_year?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# test cases
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# exercise 5
# problem: given a number, iterate from 1 to that number,
# summing any number between and including the number,
# that is divisible by 3 and 5.

# input: integer
# output: integer

# algorithm
# iterate from 3 to the passed in number
# checking each number to see if it is divisible by 3 or 5
# if it is then add to the running sum
# return the running sum

# def multisum(int)
#   sum = 0
#   (3..int).to_a.each { |num| sum += num if num % 3 == 0 || num % 5 == 0 }
#   sum
# end

def multisum(int)
  div_ints = (3..int).to_a.select { |num| num if num % 3 == 0 || num % 5 == 0 }
  div_ints.inject(0) { |sum, num| sum + num }
end

# test cases
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# exercise 6
# problem: given an array of numbers, return an array with the 
# same number of elements but replaced with the running sum total

# algorithm
# initialize an empty array, results
# initialize a current total variable to 0
# iterate through the passed in array from 0 to the length minus 1
# add the current element of the array to the total variable
# store it in the results array
# return the results array

# def running_total(array)
#   results = []
#   total = 0
#   (0...array.length).each do |idx|
#     results << total += array[idx]
#   end
#   results
# end

# using map
# def running_total(array)
#   total = 0
#   array.map { |num| total += num }
# end

# using inject
def running_total(array)
  results = []
  (0...array.length).each do |idx|
    results << array[0..idx].inject(0) { |sum, num| sum + num }
  end
  results
end

# test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# exercise 7
# problem: convert a string to an integer without the built in #to_i method

# input: string
# output: integer

# algorithm
# using an array of numbers between 0 and 9,
# replace the string characters with the corresponding number

STR_TO_INT = %w(0 1 2 3 4 5 6 7 8 9)

def string_to_integer(string)
  int_array = string.chars.map { |char| STR_TO_INT.index(char) }
  new_num = 0
  exp = int_array.length - 1
  int_array.each do |num|
    new_num += num * 10**exp
    exp -= 1
  end
  new_num
end

# test cases
# p string_to_integer('4321') #== 4321
# p string_to_integer('570') == 570

# exercise 8
# requirements
# display - sign if a negative number
# display no leading +/= sign if a + sign or nothing is passed in

# def string_to_signed_integer(string)
#   case string.chars.first
#   when '-'
#     -string_to_integer(string[1..-1])
#   when '+'
#     string_to_integer(string[1..-1])
#   else
#     string_to_integer(string)
#   end
# end

# refactored

def string_to_signed_integer(string)
  sign = string.chars.first
  string = string[1..-1] if sign =~ /[+-]/
  int = string_to_integer(string)
  case sign
  when '-' then -int
  else int
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
=end

# exercise 9
# problem: convert an integer to a string without using the built in methods

# algorithm: 
# break apart the digits by dividing by 10 until division yields 0
# store each digit in an array
# iterate through the array, passing in the value as the index to INT_TO_STR 
# to retrieve the string, use map for this
# join the new strings together

INT_TO_STR = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(int)
  int_arr = []
  loop do
    result, remain = int.divmod(10)
    int_arr.unshift(remain)
    int = result
    break if result == 0
  end
  int_arr.map { |num| INT_TO_STR[num] }.join
end

# test cases
# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# exercise 10
# problem: convert a signed integer to a string, including the +/- sign

def string_to_signed_integer(string)
  sign = string.chars.first
  string = string[1..-1] if sign =~ /[+-]/
  int = string_to_integer(string)
  case sign
  when '-' then -int
  else int
  end
end

def signed_integer_to_string(int)
  sign = case int <=> 0
         when 0 then ''
         when 1 then '+'
         when -1 then '-'
         end
  str_val = integer_to_string(int.abs)
  str_val = sign + str_val if int != 0
  str_val
end

# test cases
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'