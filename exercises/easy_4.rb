# RB101 Exercises
# easy_4.rb

=begin
# problem 1
# write a method that takes two string inputs of different lengths
# and concatenates the shorter string plus the longer string plus
# the shorter string again

# input: two strings
# output: one string

# Assumptions/Requirements
# The two input strings must be of differing lengths
# One (and only one) of the strings can be empty (length 0)

# Algorithm
# Determine the lengths of string 1 and string 2
# If string 1 < string 2 then concatenate as follows:
  # string 1 + string 2 + string 1
# Else concatenate as follows:
  # string 2 + string 1 + string 2

def short_long_short(string1, string2)
  if string1.length < string2.length
    return string1 + string2 + string1
  else
    return string2 + string1 + string2
  end
end


# test cases
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# problem 2
# given a year, return the century (number and number extension, ex: "th")
# assuming year will be an integer > 0

# first attempt
def century(year)
  year_str = year.to_s
  year_len = year_str.length
  return "1st" if year_str.length < 3
  if year_str.slice(-2,2) == "00"
    cent_num = year_str.slice(0,year_len - 2).to_i
  else
    cent_num = year_str.slice(0,year_len - 2).to_i + 1
  end
  # append extension
  if ["11","12","13"].include?(cent_num.to_s.slice(-2,2))
    cent = cent_num.to_s + "th"
  else
    case cent_num.to_s.slice(-1)
    when "1"
      cent = cent_num.to_s + "st"
    when "2"
      cent = cent_num.to_s + "nd"
    when "3"
      cent = cent_num.to_s + "rd"
    else
      cent = cent_num.to_s + "th"
    end
  end
  return cent
end

# with two methods
# one method for the century (number)
# second method for the number extension (ex: 'th')

def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0 
  century.to_s + century_ext(century)
end

def century_ext(century)
  return 'th' if [11,12,13].include?(century % 100)
  last_digit = century % 10
  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end
  

year = 2001
p century(year)

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

# problem 3
# leap years

# input: year > 0
# output: true or false

# Rules
# If divisible by 400 -> leap year
# If divisible by 4 and not divisible by 100 -> leap year
# Else not leap year

# def leap_year?(year)
#   return true if year % 400 == 0
#   return true if (year % 4 == 0 and year % 100 != 0)
#   return false
# end

# writing it by checking divisibility by 4 first
def leap_year?(year)
  if year % 4 == 0
    if year % 100 != 0
      true
    elsif year % 400 == 0
      true
    else
      false
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

# problem 4
# prior to (and including) 1752 any year that is divisible by 4 is a leap year
# after 1752 leap year rules follow the rules above

# my attempt
# def leap_year?(year)
#   if year <= 1752
#     year % 4 == 0? true : false
#   else
#     return true if year % 400 == 0
#     return true if (year % 4 == 0 and year % 100 != 0)
#     return false
#   end
# end
  
# provided solution
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

# problem 5
# input: integer
# output: integer

# Return sum of multiples of 3 and 5 that are less than the number that was passed in

# Rules/Requirements/Assumptions
# Input integer is greater than 1
# If 2 is passed in the result will be 0
# If the integer passed in is divisible by 3 or 5 (or both) then that number
# will be included in the sum

# Algorithm
# Initialize a variable sum to 0
# Iterate from 3 through the number that was passed in (ex: 3..20)
# Check to see if that number is divisible by 3 or 5
# If it is then increment the sum by that number
# Stop when the number is reached
# Return the sum variable

def multisum(num)
  sum = 0
#  return 0 if num == 2
  range = 2..num
  range.each do |int|
    if int % 3 == 0 || int % 5 == 0
      sum += int 
    end
  end
  sum
end

# test cases
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
p multisum(2) == 0

# using inject
# I can't get this to work...
# { |sum, n| sum + n } 
(5..10).inject do |sum, n|
  if n % 3 == 0
    sum + n
  end
end

# problem 6
# input: array
# output: array

# statement of problem
# return an array the same length as the array that is passed in
# return array will contain the running total of the sum of the elements
# of the passed in array

# Assumptions/Requirements
# An empty array that is passed in will return an empty array
# One element array will return the same element that was passed in

# Algorithm
# If passed in array contains < 2 elements then return the array that was passed in
# Initialize a counter to 1
# Initialize a sum variable to the value of the first element in the passed in array
# Initialize a running total array with the first element equal to 
# the first element of the array that was passed in
# Iterate through the array, adding the new value to the sum variable
# Add the updated sum variable as the next element in the running total array
# Stop after the last element has been summed

# my attempt
# def running_total(org_array)
#   return org_array if org_array.length < 2
#   counter = 1
#   sum = org_array[0]
#   running_tot_array = [org_array[0]]

#   loop do
#     sum += org_array[counter]
#     running_tot_array << sum
#     counter += 1
#     break if counter == org_array.size
#   end
#   running_tot_array
# end

# using map
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

# using each with object
#evens = (1..10).each_with_object([]) { |i, a| a << i*2 }
#=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
def running_total(array)
  sum = 0
  array.each_with_object([]) { |value, a| a << sum += value }
end


# test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# problem 7
# convert a string to an integer without using built in methods

def string_to_integer(string)
  str_to_int_hash = { '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, 
  '6'=>6, '7'=>7, '8'=>8, '9'=>9, '0'=>0 }
  
  new_array = string.split(//).map do |str|
    str_to_int_hash[str]
  end
  final_output = 0
  new_array.each_with_index do |num, index|
    final_output += (num * (10 ** (new_array.length - index - 1)))
  end
  return final_output
end

# p string_to_integer('4321')

# test cases
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# problem 7a
# convert a hexidecimal to an integer without using built in methods

HEX_TO_INT = { '0'=>0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, 
'6'=>6, '7'=>7, '8'=>8, '9'=>9, 'A'=>10, 'B'=>11, 'C'=>12, 'D'=>13,
'E'=>14, 'F'=>15, 'a'=>10, 'b'=>11, 'c'=>12, 'd'=>13, 'e'=>14, 'f'=>15 }

def hexadecimal_to_integer(hex)
  new_array = hex.split(//).map do |str|
    HEX_TO_INT[str]
  end
  final_output = 0
  new_array.each_with_index do |num, index|
    final_output += (num * (16 ** (new_array.length - index - 1)))
  end
  return final_output
end

# test case
p hexadecimal_to_integer('4D9f') == 19871

# problem 8

STRING_TO_INT = { '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, 
'6'=>6, '7'=>7, '8'=>8, '9'=>9, '0'=>0 }

# def string_to_signed_integer(string)
#   # removing + or - from the new_array
#   num_only = string
#   num_only = string[1..string.length] if (string[0] == '-' || string[0] == '+')
#   new_array = num_only.split(//).map { |str| STRING_TO_INT[str] }
#   final_output = 0
#   new_array.each_with_index do |num, index|
#     final_output += (num * (10 ** (new_array.length - index - 1)))
#   end
#   if string[0] == '-'
#     return -1 * final_output
#   else
#     final_output
#   end
# end

# using method from prior problem

def string_to_integer(string)
  new_array = string.split(//).map do |str|
    STRING_TO_INT[str]
  end
  final_output = 0
  new_array.each_with_index do |num, index|
    final_output += (num * (10 ** (new_array.length - index - 1)))
  end
  return final_output
end

def string_to_signed_integer(string)
  # removing + or - from the new_array
  string = string[1..-1] if string[0] == '+'
  if string[0] == '-'
    return -1 * string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

# test cases
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
=end

# problem 9
# integer to string
INT_TO_STRING = { 1=>'1', 2=>'2', 3=>'3', 4=>'4', 5=>'5', 
  6=>'6', 7=>'7', 8=>'8', 9=>'9', 0=>'0' }
  
  # def integer_to_string(int)
  #   return '0' if int == 0
  #   new_array = []
  #   while int > 0
  #     new_array.unshift(INT_TO_STRING[int % 10])
  #     int /= 10
  #   end
  #   return new_array.join
  # end
  
  
  # using prepend and divmod
  def integer_to_string(int)
    return '0' if int == 0
    new_str = ''
    while int > 0
      int, remainder = int.divmod(10)
      new_str.prepend(INT_TO_STRING[remainder])
    end
    return new_str
  end
  
  
  # test cases
  # p integer_to_string(4321) == '4321'
  # p integer_to_string(0) == '0'
  # p integer_to_string(5000) == '5000'
  
  # problem 10
  # handle negative numbers
  # add leading plus sign for positive numbers
  
  # def signed_integer_to_string(int)
  #   if int > 0
  #     '+' + integer_to_string(int)
  #   elsif int < 0 
  #     '-' + integer_to_string(int*-1)
  #   else '0'
  #   end
  # end
  
  # refactor to only one integer_to_string call
  def signed_integer_to_string(int)
    new_str = integer_to_string(int.abs)
    if int > 0
      '+' + new_str
    elsif int < 0 
      '-' + new_str
    else '0'
    end
  end
  
  # test cases
  p signed_integer_to_string(4321) == '+4321'
  p signed_integer_to_string(-123) == '-123'
  p signed_integer_to_string(0) == '0'
  