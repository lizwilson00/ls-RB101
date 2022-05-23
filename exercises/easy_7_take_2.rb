# RB101
# Exercises
# easy_7_take_2.rb

=begin

# exercise 1
# problem
# given two arrays with the same number of elements in each
# combine together into one array with alternating elements from
# each array, starting with array 1

# algorithm
# initialize a new array called results_arr = []
# iterate from 0...array1.length, call this index
  # add the element in array1[index] to results_array
  # add the element in array2[index] to results_array
# return results_arr

def interleave(array1, array2)
  results_arr = []
  (0...array1.length).each do |index|
    results_arr << array1[index]
    results_arr << array2[index]
  end
  results_arr
end


# test case
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# exercise 2
# problem
# given a string, return a hash the includes the count of lowercase characters, 
# uppercase characters, and characters that are neither

# algorithm
# initialize the result_hash = { lowercase: 0, uppercase: 0, neither: 0 }
# iterate through each character in the string
  # if the character is lowercase then increment the lowercase count in the hash by 1
  # if the character is uppercase then increment the uppercase count in the hash by 1
  # else increment the neither count in the hash by 1
# return result_hash

# def letter_case_count(string)
#   results_hash = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char do |char|
#     if char =~ /[a-z]/
#       results_hash[:lowercase] += 1
#     elsif char =~ /[A-Z]/
#       results_hash[:uppercase] += 1
#     else
#       results_hash[:neither] += 1
#     end
#   end
#   results_hash
# end

# using count
def letter_case_count(string)
  results_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str_array = string.chars
  results_hash[:lowercase] = str_array.count { |char| char =~ /[a-z]/ }
  results_hash[:uppercase] = str_array.count { |char| char =~ /[A-Z]/ }
  results_hash[:neither] = str_array.count { |char| char =~ /[^a-zA-Z]/ }
  results_hash
end

# test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# exercise 3
# problem
# given a string with words, capitalize each word and downcase the rest of the letters 
# of the word
# if the word starts with a non-character (such as a quote) then skip the word

# algorithm
# split the string into words, save to an array
# iterate through each word in the array
# if word starts with a letter (lower or upper) then downcase the word and capitalize the first letter
# else do nothing with the word
# join the words together with a space

def word_cap(string)
  string.split(' ').map { |word| word.capitalize }.join(' ')
end

# test cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# exercise 4
# problem
# given a string, return a string where the case of each character is swapped
# an uppercase letter will become a lowercase letter and vice-versa

def swapcase(string)
  string.chars.map { |char| char =~ /[a-z]/ ? char.upcase : char.downcase }.join
end

# test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# exercise 5
# problem
# given a string, return a new string that contains the same elements as the original
# string but with every character alternating between uppercase and lowercase
# non-letter characters will not change but will "count" when determining whether the 
# next letter should be switched to upper or lower case

# algorithm
# split the string into characters
# initialize a variable new_chars = []
# iterate over each character using each with index
# if the index is even then change the character to uppercase
# else change the character to lowercase
# join the return array 

# def staggered_case(string)
#   new_chars = []
#   string.chars.each_with_index do |char, index|
#     if index.even?
#       new_chars << char.upcase
#     else
#       new_chars << char.downcase
#     end
#   end
#   new_chars.join
# end

def staggered_case(string)
  result = ''
  need_upper = false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# test cases
p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

# exercise 6
def staggered_case(string, ignore = false)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if ignore && char =~ /[^a-zA-Z]/
      result += char
      next
    else
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    end
  end
  result
end

# test cases
p staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', true) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# exercise 7
def show_multiplicative_average(array)
  result = (array.inject(:*) / array.length.to_f).round(3)
  puts "The result is #{format('%.3f', result)}"
end


# test cases
p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# exercise 8
def multiply_list(array1, array2)
  (0...array1.length).map { |idx| array1[idx] * array2[idx] }
end

# test case
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# exercise 9
# algorithm
# initialize a pairs array []
# iterate through idx1 which will go from 0...array1.length
# iterate through idx2 which will go from 0...array2.length
# add [array1[idx1], array2[idx1]] to pairs
# initialize a results array []
# iterate through pairs, multiplying each pair, adding the result to the results array
# sort the results array and return it

def multiply_all_pairs(array1, array2)
  result = []
  array1.each do |item1|
    array2.each do |item2|
      result << item1 * item2
    end
  end
  result.sort
end

# test case
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# exercise 10
def penultimate(string)
  string.split(' ')[-2]
end


# test cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
=end

# middle word exercise
# rules
# if an empty string is passed in, return an empty string
# if a one word string is passed in, return the word
# if a two word string is passed in, return both words
# if a string has an odd number of words, return the middle word
# if a string has an even number of words, return the two middle words

# algorithm
# string_arr = string split into words
# find the middle_idx = find the length of string_arr and divide by two
# if the number of words is even then return 
  # word at middle_idx - 1 + word at middle_idx
# if the number of words is odd then return 
  # word at middle_idx

def middle_word(string)
  result = ''
  string_arr = string.split(' ')
  middle_idx = string_arr.length / 2  
  if string_arr.length.even? && !string_arr.length.zero?
    result = string_arr[middle_idx - 1, 2].join(' ')
  elsif string_arr.length.odd?
    result << string_arr[middle_idx]
  end
  result
end


# test cases
p middle_word('last word') == 'last word'
p middle_word('') == ''
p middle_word('middle') == 'middle'
p middle_word('which is the middle word') == 'the'
p middle_word('this is middle word') == 'is middle'