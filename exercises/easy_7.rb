# RB101
# Exercises
# easy_7.rb

=begin
# problem 1
# def interleave(arr1, arr2)
#   new_arr = []
#   counter = 0
#   loop do
#     new_arr << arr1[counter]
#     new_arr << arr2[counter]
#     counter += 1
#     break if counter == arr1.length
#   end
#   new_arr
# end

# using zip
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) 

# test case
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# problem 2
# def letter_case_count(str)
#   hsh = { lowercase: 0, uppercase: 0, neither: 0 }
#   lower = /[a-z]/
#   upper = /[A-Z]/
#   str.each_char do |c|
#     if c =~ lower
#       hsh[:lowercase] += 1
#     elsif c =~ upper
#       hsh[:uppercase] += 1
#     else
#       hsh[:neither] += 1
#     end
#   end
#   hsh
# end

# using count method
def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  all = lower + upper
  str_arr = str.chars
  hsh[:lowercase] = str_arr.count { |c| lower.include?(c) }
  hsh[:uppercase] = str_arr.count { |c| upper.include?(c) }
  hsh[:neither] = str_arr.count { |c| all.none?(c) }
  hsh
end

# test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# problem 3
def word_cap(str)
  str_arr = str.split
  str_arr.map { |word| word.capitalize }.join(' ')
end

# another way without the capitalize method
def word_cap(str)
  str_arr = str.downcase.split.map do |word| 
    word[0].upcase + word[1..-1] 
  end
str_arr.join(' ')
end

# a second way without the capitalize method
def word_cap(str)
  str_arr = str.downcase.split.map do |word| 
    word[0].swapcase + word[1..-1] 
  end
str_arr.join(' ')
end

# test cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# problem 4
LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

def swapcase(str)
  swapped_str = ''
  str.each_char do |s|
    if LOWER.include?(s)
      swapped_str << s.upcase
    elsif UPPER.include?(s)
      swapped_str << s.downcase
    else
      swapped_str << s
    end
  end
  swapped_str
end

# test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# problem 5
# def staggered_case(str)
#   counter = 0
#   stag_str = ''
#   loop do
#     if counter.even?
#       stag_str << str[counter].upcase
#     else
#       stag_str << str[counter].downcase
#     end
#     counter += 1
#     break if counter == str.length
#   end
#   stag_str
# end

# ls solution, further exploration (swap in opposite direction)
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
p staggered_case('I Love Launch School!') # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers')# == 'IgNoRe 77 ThE 444 NuMbErS'

# problem 6
def staggered_case(str)
  stag_str = ''
  need_upper = true
  str.chars.each do |c|
    if c =~ /[a-zA-Z]/
      if need_upper
        stag_str << c.upcase
      else
        stag_str << c.downcase
      end
      need_upper = !need_upper
    else
      stag_str << c
    end
  end
  stag_str
end

# test cases
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# problem 7
# def show_multiplicative_average(arr)
#   result = (arr.inject(:*)/(arr.length)).to_f
#   puts "The result is #{format("%.3f", result)}"
# end

# if you omit the to_f
# you get zeros in the 3 decimal places instead of the correct numbers
def show_multiplicative_average(numbers)
  product = 1
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

# test cases
p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# problem 8
# def multiply_list(arr1, arr2)
#   counter = 0
#   result_arr = []
#   loop do
#     result_arr << arr1[counter] * arr2[counter]
#     counter += 1
#     break if counter == arr1.length
#   end
#   result_arr
# end

# using each_with_index
# def multiply_list(arr1, arr2)
#   result_arr = []
#   arr1.each_with_index do |elem, index|
#     result_arr << elem * arr2[index]
#   end
#   result_arr
# end

# using zip
def multiply_list(arr1, arr2)
  Array.new(arr1.length, 1).zip(arr1, arr2).map { |arr| arr.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])

# test cases
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# problem 9
def multiply_all_pairs(arr1, arr2)
  result_arr = []
  arr1.each do |num|
    arr2.each do |num2|
      result_arr << num * num2
    end
  end
  result_arr.sort
end

# test cases
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# problem 10
def penultimate(words)
  words.split[-2]
end

# test cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
=end

# middle word
# requirements
# given a string of words return the word in the middle

# edge cases
# if empty string then returns empty string
# if one word then returns the word that was passed in (1 -> element 0)
# if two words then returns the second word (2 -> element 1)
# if even number of words then returns the word after the middle (4 -> element 2)
# if odd then return the word in the middle (3 -> element 1)

def middle_word(str)
  str_arr = str.split
  index = str_arr.length / 2
  str_arr == [] ? str : str_arr[index]
end

# test cases
p middle_word("")
p middle_word(" ")
p middle_word("test")
p middle_word("test two")
p middle_word("test three words")
p middle_word("testing four total words")