# RB101
# Easy 1 - 2nd Try

=begin
# problem 1
# repeat yourself
def repeat(string, num)
  num.times { |_| puts string }
end

# test case
repeat('Hello', 3)

# problem 2
# input = integer
# output = boolean

def is_odd?(num)
  num.odd?
end

# test cases
p is_odd?(2)    == false
p is_odd?(5)    == true
p is_odd?(-17)  == true
p is_odd?(-8)   == false
p is_odd?(0)    == false
p is_odd?(7)    == true

# problem 3
# input = integer
# output = array

def digit_list(int)
  int.to_s.chars.map { |str| str.to_i }
end

# test cases
p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true

# problem 4
# input: array
# output: hash

# problem: create a hash with each unique item and the count of how many occurrences there are of that item

# def count_occurrences(array)
#   item_hash = {}
#   array.each do |item|
#     if item_hash[item]
#       item_hash[item] += 1
#     else
#       item_hash[item] = 1
#     end
#   end
#   item_hash
# end

# using count
def count_occurrences(array)
  item_hash = {}
  uniq_items = array.uniq
  uniq_items.each do |item|
    item_hash[item] = array.count(item)
  end
  item_hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# problem 5
# input: string
# output: string

# problem: reverse the words in the string
# spaces separate words

# Split the phrase into words and store in an array
# Reverse the words
# Join the words back together into a string

def reverse_sentence(phrase)
  phrase.split(' ').reverse.join(' ')
end

# test cases
p reverse_sentence('Hello World') == 'World Hello'
p reverse_sentence('Reverse these words') == 'words these Reverse'
p reverse_sentence('') == ''
p reverse_sentence('    ') == '' # Any number of spaces results in ''

# problem 6
# reverse it (part2)
def reverse_words(phrase)
  reversed_words = phrase.split.map do |word| 
    word.reverse! if word.length >= 5
    word
  end
  reversed_words.join (' ')
end


# test cases
p reverse_words('Professional')          == "lanoisseforP"
p reverse_words('Walk around the block') == "Walk dnuora the kcolb"
p reverse_words('Launch School')         == "hcnuaL loohcS"

# problem 7
# stringy strings
# input: integer
# output: string

# problem: return a string of alternating 1s and 0s (starting with 1) the same length as the integer passed in

# initialize an empty string variable
# iterate n number of times where n is the integer passed in
# When n is even add 1 to the string, else add 0
# return the string

def stringy(int, first_num = 1)
  string = ''
  int.times do |n|
    if first_num == 1
      one_or_zero = n.even? ? '1' : '0'
    else
      one_or_zero = n.even? ? '0' : '1'
    end
    string << one_or_zero
  end
  string
end

# test cases
p stringy(6) == '101010'
p stringy(9) == '101010101'
p stringy(4) == '1010'
p stringy(7) == '1010101'
p stringy(7, 0) == '0101010'

# problem 8 
# array average
# input: array
# output: integer

# return the average of the integers passed in

# def average(array)
#   array.sum / array.length
# end

# using inject
def average(array)
  sum = array.inject { |sum, num| sum + num }
  (sum / array.length.to_f).round(1)
end

# test cases
p average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
p average([1, 5, 87, 45, 8, 8]) #== 25
p average([9, 47, 23, 95, 16, 52]) #== 40

# problem 9 
# input: integer
# output: integer

# requirements:
# return the sum of the digits of the input integer

# algorithm
# convert to string
# split string into characters
# iterate through the array and convert each to an integer

def sum(num)
  num.to_s.chars.map(&:to_i).inject { |sum, int| sum + int}
end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end

# problem 10
# input: integer, boolean
# output: integer

def calculate_bonus(int, bool)
  bool ? int / 2 : 0
end


# test cases
p calculate_bonus(2800, true) == 1400
p calculate_bonus(1000, false) == 0
p calculate_bonus(50000, true) == 25000