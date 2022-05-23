# RB101
# Exercises
# easy_3_take_2.rb

=begin
# exercise 1
num_array = []
puts "==> Enter the 1st number:"
num_array << gets.chomp.to_i

puts "==> Enter the 2nd number:"
num_array << gets.chomp.to_i

puts "==> Enter the 3rd number:"
num_array << gets.chomp.to_i

puts "==> Enter the 4th number:"
num_array << gets.chomp.to_i

puts "==> Enter the 5th number:"
num_array << gets.chomp.to_i

puts "==> Enter the last number:"
last_num = gets.chomp.to_i

if num_array.include?(last_num)
  puts "The number #{last_num} appears in #{num_array}."
else
  puts "The number #{last_num} does not appear in #{num_array}."
end

# exercise 2
puts "==> Enter the first number:"
num_1 = gets.chomp.to_i

puts "==> Enter the second number:"
num_2 = gets.chomp.to_i

sum = num_1 + num_2
diff = num_1 - num_2
product = num_1 * num_2
quotient = num_1 / num_2
remain = num_1 % num_2
power = num_1 ** num_2

puts "==> #{num_1} + #{num_2} = #{sum}"
puts "==> #{num_1} - #{num_2} = #{diff}"
puts "==> #{num_1} * #{num_2} = #{product}"
puts "==> #{num_1} / #{num_2} = #{quotient}"
puts "==> #{num_1} % #{num_2} = #{remain}"
puts "==> #{num_1} ** #{num_2} = #{power}"

# exercise 3
puts "Please write word or multiple words:"
words = gets.chomp
length = words.gsub(" ","").length

# puts 'There are ' + length.to_s + ' characters in "' + words +'".'
puts "There are #{length} characters in \"#{words}\"."

# exercise 4
def multiply(num_1, num_2)
  num_1 * num_2
end

# p multiply(5, 3) == 15

# exercise 5
def square(num)
  multiply(num, num)
end

# p square(5) == 25
# p square(-8) == 64

def power(num, pwr)
  multiply(num, num**(pwr - 1))
end

p power(2, 3) == 8
p power(1, 10) == 1
p power(4, 2) == 16

# exercise 6

# problem
# given two arguments, return true if exactly one of its arguments is truthy, false otherwise
# input: two arguments
# output: boolean

# Examples
# see test cases

# algorithm
# create a local variable, result = []
# check to see if both arguments are truthy
# or both arguments are not truthy
# return false if either of those are truthy
# else return true

def xor?(arg1, arg2)
  return false if (arg1 && arg2) || (!arg1 && !arg2)
  true
end

# test cases
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# exercise 7
# problem: given a list of items in an array return an array containing
# every other element, starting with the first element
# when the array that is passed in is empty, return an empty array

# input: array
# output: array

# examples:
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities(['abc', 'def']) == ['abc']
# oddities([]) == []

# data structure
# use a results array to store the target values
# return that array

# algorithm
# create an empty array, results
# iterate through the input array
# selecting only the elements with an even index

def oddities(array)
  results = []
  array.each_with_index do |elem, idx|
    results << elem if idx.even?
  end
  results
end

# test cases
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
=end

# exercise 8
# problem: given a string, if it is a palindrome, return true, else false

def palindrome?(str_or_arr)
  str_or_arr.reverse == str_or_arr
end

# test cases
# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true
# p palindrome?(['a', 'b', 'a']) == true
# p palindrome?([1, 2, 3]) == false

# exercise 9
# problem: given a string, ignoring non-alphanumeric characters, 
# if it is a palindrome, return true, else false

# algorithm
# remove non-alphanumeric characters and downcase
# pass in to the palindrome? method from exercise 8

def real_palindrome?(string)
  cleansed_str = string.downcase.chars.select { |char| char =~ /[a-z0-9]/ }
  palindrome?(cleansed_str)
end

# test cases
# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# exercise 10
def palindromic_number?(int)
  palindrome?(int.to_s)
end

# test cases
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true