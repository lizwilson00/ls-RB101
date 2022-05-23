#RB101
#Lesson 1
#Easy_1 Exercises
#1
=begin
def repeat(fav_string, num_times)
  num_times.times { puts fav_string }
end

repeat('Hello', 3)

#2
# def is_odd?(num)
#   if num.abs % 2 == 0
#     false
#   else
#     true
#   end
# end

def is_odd?(num)
  num.abs % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

#3
def digit_list(num)
  num.to_s.split('').map(&:to_i)
end

p digit_list(12345)

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

#4
vehicles = [
  'car', 'car', 'truck', 'car', 'suv', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(veh)
  veh_hash = {}
  veh.map!(&:downcase)
  veh.uniq.each do |v|
    veh_hash[v] = veh.count(v)
  end
  veh_hash.each do |v, cnt|
    puts "#{v} => #{cnt}"
  end
end

count_occurrences(vehicles)

#5
#my attempt
# #split and put words into an array
# def reverse_sentence(phrase)
#   arr = phrase.split
#   rev_arr = []
# #iterate over the array (while loop), inserting words backwards into a new array
#   while arr.count > 0
#     rev_arr.push(arr[-1])
#     arr.pop
#   end
# #put the words together with spaces in between words
#   return rev_arr.join(" ")
# end

#the solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end

#test cases
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

#6
# def reverse_words(phrase)
#   arr = phrase.split
#   arr.map! do |i|
#     if i.length >= 5
#       i.reverse
#     else
#       i
#     end
#   end
#   arr.join(' ')
# end

#rewrite with each
def reverse_words(phrase)
  words = []
  phrase.split.each do |w|
    w.reverse! if w.length >= 5
    words << w
  end
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

#7
#original attempt
def stringy(num)
  count = 1
  str = ''
  num.times do
    if count % 2 == 1
      str.concat('1')
    else 
      str.concat('0')
    end
    count += 1
  end
  return str
end

#updated to use an array and ternary
def stringy(num)
  arr = []
  num.times do |index|
    number = index.even? ? 1 : 0
    arr << number
  end
  arr.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

#updated to allow for reverse 1 and 0 order parameter
def stringy(num, rev=1)
  arr = []
  num.times do |index|
    if rev == 0
      number = index.even? ? 0 : 1
    else
      number = index.even? ? 1 : 0
    end
    arr << number
  end
  arr.join
end

puts stringy(6) == '101010'
puts stringy(9,0) == '010101010'
puts stringy(4,0) == '0101'
puts stringy(7) == '1010101'

#8
# def average(arr)
#   arr.sum / arr.length
# end


# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

#return float
def average(arr)
  (arr.sum.to_f / arr.length).round(1)
end

puts average([1, 6]) 
puts average([1, 5, 87, 45, 8, 8])

#9
# def sum(num)
#   arr = num.to_s.split('')
#   arr.map!(&:to_i)
#   arr.sum
# end

#reducing this down to one line
# def sum(num)
#   num.to_s.split('').map(&:to_i).reduce(:+)
# end

#another method using loops
def sum(num)
  sum = 0
  arr = num.to_s.split('')
  arr.each do |digit|
    sum += digit.to_i
  end
  return sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

#10
# def calculate_bonus(salary, bonus_flag)
#   if bonus_flag
#     (salary / 2).round(2)
#   else
#     0
#   end
# end

#using ternary operator
def calculate_bonus(salary, bonus_flag)
  bonus_flag ? (salary / 2).round(2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

#random practice
#return count of the number of items that are greater than 5
# arr = [17, 6, 3, 7, 9, 1]

# puts arr.count { |num| num > 5 }
=end

#random numbers
#validate if they are prime or not
#example numbers 5, 4, 6, 7
#input = user inputs a positive integer greater than 1
#output = 'prime' (indicates prime) or 'not prime' (indicates not prime)

#Assumptions: 
#User inputs a valid value
#Prime numbers are numbers ONLY divisible by themselves and 1
#Prime numbers must be greater than 1

#Implicit requirements
#No error handling for invalid inputs is required

#Mental model
#Divide number by 2, if no remainder then return false, otherwise continue
#Divide number by 3, if no remainder than return false, otherwise continue
#...
#Divide number by number-1, if no remainder then return false, otherwise return true

#Test Cases
#2 => 'prime'
#3 => 'prime'
#13 => 'prime'
#21 => 'not prime'

puts "Please enter an integer greater than 1: "
num = gets.chomp.to_i

count = num - 1
result = 'prime'
while count > 1 do
  if num % count == 0
    result = 'not prime'
    break
  else
    count -= 1
  end
#  result = 'prime'
end
puts result
  

