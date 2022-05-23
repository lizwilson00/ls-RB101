# RB101
# Exercises
# easy_8_take_2.rb

=begin
# exercise 1
# algorithm
# create subarrays that start with index 0
# ending index will be 0 through length of the array - 1
# iterate from 0...array.length
# initialize an array of arrays
# add each array to this array
# flatten the array
# return the sum of the numbers in the array

def sum_of_sums(array)
  sum = 0
  (0...array.length).each do |end_idx|
    sum += array[0..end_idx].reduce(:+)
  end
  sum
end

# test cases
p sum_of_sums([3, 5, 2]) == 21
# (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 36
# (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# exercise 3
def leading_substrings(string)
  results = []
  (0...string.length).each do |end_idx|
    results << string[0..end_idx]
  end
  results
end

# test cases
# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# exercise 4

# algorithm
# initialize a results array, []
# pass in full string to leading_substrings method
# add these substrings to the results array
# pass in array[1..-1]
# add the substrings
# pass in array [2..-1]
# first index is 0 through string.length - 1
# return results

def substrings(string)
  results = []
  (0...string.length).each do |first_idx|
    results << leading_substrings(string[first_idx..-1])
  end
  results.flatten
end


# test cases
# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# exercise 5
# problem: return a list of substrings of a passed in string
# which are palindromes (letters spelled backward are the 
# same as forward), case and special characters are all considered
# one character is not a palindrome
# return an empty array if there are no palindromic strings

# data structure
# return substrings in an array

# algorithm:
# write a method ispalindrome? that will determine if a string
# is a palindrome
# find all the substrings of the string
# iterate through the substrings and check if each is a palindrome
# if it is then include it in the results array
# pass back the results of the iteration

def ispalindrome?(string)
  string.reverse == string && string.length == 1
end

def palindromes(string)
  substr_array = substrings(string)
  substr_array.select { |substr| ispalindrome?(substr) }
end

# test cases
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# exercise 6
# problem: 
# given two integers, output a sequence starting with the first integer
# and ending with the second integer and incrementing by 1
# if a given number is divisible by 3 then print 'Fizz' instead of the number
# if a given number is divisible by 5 then print 'Buzz' instead of the number
# if a given number is divisible by 15 then print 'FizzBuzz' instead of the number

# data structure:
# collect the sequence in an array

# algorithm:
# initialize a results array []
# iterate through each number from start_num to end_num
# if the number is divisible by 3 then add Fizz to the results array
# if the number is divisible by 5 then add Buzz to the results array
# if the number is divisible by 15 then add FizzBuzz to the results array
# else add the number to the results array
# output the results array joined by ', '

def fizzbuzz(start_num, end_num)
  results_array = []
  (start_num..end_num).each do |num|
    new_num = if num % 15 == 0
                'FizzBuzz'
              elsif num % 5 == 0
                'Buzz'
              elsif num % 3 == 0
                'Fizz'
              else
                num
              end
    results_array << new_num
  end
  puts results_array.join(', ')
end

# test case
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# exercise 7
def repeater(string)
  new_string = ''
  string.each_char do |char|
    new_string << char * 2
  end
  new_string
end


# test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# exercise 8
def double_consonants(string)
  new_string = ''
  string.each_char do |char|
    if char.downcase =~ /[a-z]/ && char =~ /[^aeiou]/
      new_string << char * 2
    else
      new_string << char
    end
  end
  new_string
end


# test cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# exercise 9
def reversed_number(int)
  int.to_s.chars.reverse.join.to_i
end


# test cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
=end

# exercise 10
# algorithm
# if string length is odd, return the character at index len/2
# if string length is even, return the character at index len/2 - 1 and len/2

def center_of(string)
  str_len = string.length
  ctr_idx = str_len/2
  if str_len.odd?
    string[ctr_idx]
  else
    string[ctr_idx -1, 2]
  end
end

# test cases
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'