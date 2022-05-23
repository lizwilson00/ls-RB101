# RB101
# exercises
# easy_8.rb

=begin
# problem 1
# two number array
# sum element at index 0 + elem at ind 0 + elem at ind 1
# three number array
# 3 * (elem at ind 0) + 2 * (elem at ind 1) + 1 * (elem at ind 2)

# def sum_of_sums(arr)
#   result = 0
#   multiplier = arr.length
#   loop do
#     result += multiplier * arr[arr.length - multiplier]
#     multiplier -= 1
#     break if multiplier == 0
#   end
#   result
# end

# after seeing solution
def sum_of_sums(num_arr)
  total = 0
  1.upto(num_arr.length) do |count|
    total += num_arr.slice(0, count).inject(:+)
  end
  total
end

# test cases
p sum_of_sums([3, 5, 2]) == 21 #(3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 36 #(1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# problem 2
# madlibs
puts "Enter a noun: "
noun = gets.chomp 
puts "Enter a verb: "
verb = gets.chomp 
puts "Enter an adjective: "
adjective = gets.chomp 
puts "Enter an adverb: "
adverb = gets.chomp 

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?  That's hilarious!"
# Do you walk your blue dog quickly? That's hilarious!

# problem 3
def leading_substrings(str)
  result_arr = []
  1.upto(str.length) do |count|
    result_arr << str.slice(0, count)
  end
  result_arr
end

# test cases
# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# problem 4
def substrings(str)
  result_arr = []
  0.upto(str.length - 1) do |count|
    substr = str[count..str.length]
    result_arr << leading_substrings(substr)
  end
  result_arr.flatten
end

# test case
# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# problem 5
def is_palindrome?(str)
  str == str.reverse and str.length > 1
end

# def palindromes(str)
#   substr_arr = substrings(str)
#   substr_arr.select do |substr|
#     is_palindrome?(substr)
#   end
# end

# further exploration
# ignore non-alphanumeric characters and case
def palindromes(str)
  str_modified = ''
  palin_arr = []
  str.downcase.each_char do |c|
    str_modified << c if c =~ /[a-zA-Z0-9]/
  end
  substr_arr = substrings(str_modified)
  palin_arr = substr_arr.select do |substr|
    is_palindrome?(substr)
  end
  palin_arr.uniq
end

p palindromes('hello-9madaM9-did-madAm-goodbye') 

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

# problem 6
def fizzbuzz(num1, num2)
  result = []
  num1.upto(num2) do |num|
    result << fizzbuzz_value(num)
  end
  puts result.join(', ')
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

# test case
p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# problem 7
def repeater(str)
  new_str = ''
  str.each_char do |c|
    new_str << c * 2
  end
  new_str
end

# test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# problem 8
def double_consonants(str)
  new_str = ''
  str.each_char do |c|
    if c =~ /[^a-zA-Z]/ || c =~ /[aeiou ]/
      new_str << c
    else
      new_str << c * 2
    end
  end
  new_str
end

p double_consonants("July 4th")

# test cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# problem 9
def reversed_number(int)
  int.to_s.reverse.to_i
end

# test cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
=end

# problem 10
def center_of(str)
  index = str.length / 2
  if str.length.odd?
    str[index]
  else
    str[index - 1] + str[index]
  end
end

# test cases
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'