# RB101 Exercises
# easy_3.rb

=begin
# 1 Searching 101
CHOICE_NUM = ['1st', '2nd', '3rd', '4th', '5th', 'last']
def prompt(cnt)
  "==> Enter the #{CHOICE_NUM[cnt]} number:"
end

counter = 0
num_array = []

while counter < 6
  puts prompt(counter)
  num_array.push(Kernel.gets().chomp().to_i)
  counter += 1
end

last_num = num_array.pop
num_array.include?(last_num) ? 
(puts "The number #{last_num} appears in #{num_array}.") : 
(puts "The number #{last_num} does not appear in #{num_array}.")

# 2 Arithmetic Integer
puts "==> Enter the first number:"
first_num = Kernel.gets().chomp().to_f

puts "==> Enter the second number:"
sec_num = Kernel.gets().chomp().to_f

# output
puts "==> #{first_num} + #{sec_num} = #{(first_num + sec_num).round(2)}"
puts "==> #{first_num} - #{sec_num} = #{(first_num - sec_num).round(2)}"
puts "==> #{first_num} * #{sec_num} = #{(first_num * sec_num).round(2)}"

# division section
if sec_num == 0 
  puts "==> #{first_num} / #{sec_num} = Cannot divide by 0."
  puts "==> #{first_num} % #{sec_num} = Cannot divide by 0."
else
  puts "==> #{first_num} / #{sec_num} = #{(first_num / sec_num).round(2)}"
  puts "==> #{first_num} % #{sec_num} = #{(first_num % sec_num).round(2)}"
end

puts "==> #{first_num} ** #{sec_num} = #{(first_num ** sec_num).round(2)}"

# 3 Counting the Number of Characters

puts "Please write word or multiple words:"
phrase = Kernel.gets().chomp

puts "There are #{phrase.delete(" ").length} characters in \"#{phrase}\"."

# 4 Multiplying Two Numbers
def multiply(num1, num2)
  num1 * num2
end

# puts multiply([5, 6], 3).inspect

# 5 Squaring an Argument
def square(num)
  multiply(num, num)
end

# puts square(5)
# puts square(-8)

# power method
# def power(num, expon)
#   if expon == 0
#     1
#   else
#     total = 1
#     while expon > 1
#       total *= multiply(num, num)
#       expon -= 2
#     end
#     expon == 1 ? (total * num) : total
#   end
# end


# recursive
def power(num, expon)
  expon == 0 ? 1 : multiply(power(num, expon-1), num)
end

puts power(5, 3)  
puts power(2, 4)

# 6 Exclusive Or
def xor?(cond1, cond2)
  return true if (cond1 && !cond2) || (!cond1 && cond2)
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# 7 Odd Lists
# def oddities(arr)
#   arr_new = []
#   counter = 0
#   while counter < arr.length
#     arr_new << arr[counter]
#     counter += 2
#   end
#   arr_new
# end

# another way
# def oddities(arr)
#   arr_new = []
#   arr.each_index {|x| arr_new << arr[x] if x.even? } 
#   arr_new
# end

# another way
# def oddities(arr)
#   arr_new = []
#   counter = 0
#   arr.each do |elem|
#     arr_new << arr[counter] if counter.even?
#     counter += 1
#   end
#   arr_new
# end

# puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# puts oddities(['abc', 'def']) == ['abc']
# puts oddities([123]) == [123]
# puts oddities([]) == []

def evens(arr)
  arr_new = []
  arr.each_index {|x| arr_new << arr[x] if x.odd? } 
  arr_new
end

puts evens([2, 3, 4, 5, 6]) == [3, 5]
puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens(['abc', 'def']) == ['def']
puts evens([123]) == []
puts evens([]) == []
=end

# 8 Palindromic Strings (Part 1)
def palindrome?(str_or_arr)
  str_or_arr == str_or_arr.reverse
end

# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true

# test if an array works
# puts palindrome?([1, 2, 3, 2, 1]) == true
# puts palindrome?(['a', 'b']) == false
# puts palindrome?([1]) == true

# 9 Palindromic Strings (Part 2)
# def real_palindrome?(str)
#   str_mod = str.downcase.delete('^a-z0-9')
#   palindrome?(str_mod)
# end

# puts real_palindrome?('madam') == true
# puts real_palindrome?('Madam') == true           # (case does not matter)
# puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# puts real_palindrome?('356653') == true
# puts real_palindrome?('356a653') == true
# puts real_palindrome?('123ab321') == false
  

# 10 Palindromic Numbers
def palindromic_number?(int)
  if int.to_s.to_i != int
    int_to_str = '0%o' % int
  else 
    int_to_str = int.to_s
  end
  palindrome?(int_to_str)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(04540) == true
