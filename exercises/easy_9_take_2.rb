# RB101
# Exercises
# easy_9_take_2.rb

=begin
# exercise 1
# problem: an array of a name and a hash with a title and occupation are passed in
# output a sentence greeting the individual and stating their title and occupation.

# algorithm
# Join the strings in the name array with spaces and insert using string interpolation
# into the desired output text.
# Pull in the values corresponding with title and occupation from the hash and insert
# them as required.

def greetings(array, hash)
  puts "Hello #{array.join(' ')}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# exercise 2
# problem:
# return 2x the number if the number is not a double number
# if it is a double number then return the number
# in order to qualify as a double number the number must be:
  # an even number of digits
  # the left hand digits must exactly match the right hand digits


# algorithm:
# set a flag to double = false if:
# new local variable of length of the num
# return 2 * num if the length of the number is odd
# check to see if the number is a double number
  # convert num to string string[0...num_len/2] == string[num_len/2..num_len]
  # if this is true then return the num
# else return 2 * num

def twice(int)
  int_str = int.to_s
  num_len = int_str.length
  return int if int_str[0...num_len/2] == int_str[num_len/2...num_len]
  int * 2
end

# test cases
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# exercise 3
def negative(int)
  -int.abs
end

# test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# exercise 4
def sequence(int)
  int < 1 ? (int..1).to_a : (1..int).to_a
end

# test cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1, 0, 1]

# exercise 5
# problem: 
# check to see if all the alphabetic characters are uppercase
# if they are then return true, else false
# ignore non-alpha characters

# algorithm
# iterate through each char in the string
# check to see if that char is an alphabetic character
  # if it is then check to see if it is uppercase
    # if it is uppercase then continue
    # if it isn't then break and return false
  # if it is not alphabetic then continue to the next character
# if all characters have been checked and the loop hasn't been broken
# then return true

# def uppercase?(string)
#   string.each_char do |char|
#     if char =~ /[^a-zA-Z]/
#       next
#     elsif char =~ /[A-Z]/
#       next
#     else
#       return false
#     end
#   end
#   true
# end

def uppercase?(string)
  string == string.upcase
end

# test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# exercise 6
# split up the words in the string, place in an array
# iterate through the array, returning the word plus a space and the word length
# return the new array

def word_lengths(string)
  string.split.map { |word| word + ' ' + word.length.to_s }
end

# test cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# exercise 7
# swap the first name and last name

def swap_name(string)
  name_arr = string.split
  name_arr[1], name_arr[0] = name_arr[0], name_arr[1]
  name_arr.join(', ')
end

# test case
p swap_name('Joe Roberts') == 'Roberts, Joe'

# exercise 8
# problem: given two arguments, 1. a count, and 2. a starting value
# as well as the value that the sequence will be incremented by
# return an array containing the number of elements equal to the count
# starting with input #2 value and incrementing each value by that same value

# algorithm
# initialize a local variable result = []
# initialize a local variable counter to 1
# start a loop
# add the counter * the starting value to the result array
# increment the counter by 1
# break when the counter > count argument

# def sequence(count, st_val)
#   result = []
#   counter = 1
#   loop do
#     break if counter > count
#     result << counter * st_val
#     counter += 1
#   end
#   result
# end

# using map
def sequence(count, st_val)
  (1..count).map { |multiplier| st_val * multiplier}
end


# test cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# exercise 9
def grade(num)
  if num >= 90 && num <= 100 
    'A'
  elsif num >= 80 && num < 90
    'B'
  elsif num >= 70 && num < 80
    'C'
  elsif num >= 60 && num < 70
    'D'
  elsif num >= 0 && num < 60
    'F'
  else
    'Invalid'
  end
end

def get_grade(gr1, gr2, gr3)
  grade((gr1 + gr2 + gr3)/3.0)
end

p get_grade(95, 90, 93) #== "A"
p get_grade(50, 50, 95) #== "D"

# exercise 10
# def buy_fruit(array)
#   results = []
#   array.each do |subarr|
#     subarr[1].times do
#       results << subarr[0]
#     end
#   end
#   results
# end

# using map
def buy_fruit(array)
  array.map { |fruit, qty| [fruit] * qty }.flatten
end

# test cases
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end

# exercise 11

# problem: output groups of words that are anagrams in one array
# output each word grouping on a different line

# algorithm:
# create an empty results array
# iterate from 0 through the length of words - 2 (this will be our 'base' word)
# call this index 1
# add the 'base' word to the results array
# compare the 'base' word to the other words (starting with index 1 + 1 through 
# the length of words - 1), call this index 2
# iterate through each character of the base word
# check to see if the count of that letter is exactly the same as the count
# of that letter in the comparison word
# if there is a mismatch then increment index 2
# if all letters match then add the word to the results array
# increment index 2 by 1
# continue to check the rest of the words until all words have been checked 
# once all the words have been checked then output the results array
# if the results array has more than one element (length > 0)
# increment index 1 by 1
# break if index 1 reaches length of words - 1

def anagrams(word_list)
  all_results = []
  results = []
  0.upto(word_list.length - 2) do |idx1|
    base_word = word_list[idx1]
    next if all_results.flatten.include?(base_word)
    results << base_word
    (idx1 + 1).upto(word_list.length - 1) do |idx2|
      comp_word = word_list[idx2]
      results << comp_word if base_word.chars.sort == comp_word.chars.sort
    end
    p results
    all_results << results
    results = []
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
anagrams(words)