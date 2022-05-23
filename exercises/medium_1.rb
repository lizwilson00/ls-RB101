#RB 101
# Exercises
# Medium 1

require "pry"

# problem 1
# rotation, part 1
# def rotate_array(arr)
#   arr[1..-1] + [arr[0]]
# end

# test cases
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# problem 2
# rotation, part 2
# def rotate_rightmost_digits(digits, qty)
#   arr = digits.to_s.chars
#   arr[-qty..-1] = rotate_array(arr[-qty..-1])
#   arr.join.to_i
# end

# test cases
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# problem 3
# def max_rotation(digits)
#   all_digits = digits
#   num_digits = all_digits.to_s.length
#   loop do
#     all_digits = rotate_rightmost_digits(all_digits, num_digits)
#     num_digits -= 1
#     break if num_digits < 2
#   end
#   all_digits
# end

# test cases
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# problem 4
# Restate the problem
# given n number of switches
# switches are all set to "off" initially
# during each "round" switches are toggled on or off (opposite of their present state)
# based on which round we are currently in
# for round one we start with the first switch and turn every single switch on
# incrementing by one
# for round two we start with the second switch and toggle every two switches
# on or off (opposite of their present state)
# for round n we start with the nth switch and toggle it on or off and we do not increment
# since there are only n switches
# for each round (call a random round r) we only increment if we can find a switch at 2r

# input is an integer greater than 0
# output is an array containing the integer values of the switches that are turned on

# examples
# n = 2
# first round turns both switches on
# second round turns switch two off
# result [1]

# n = 3
# first round turns all switches on
# second round turns switch two off [1, 3]
# third round turns switch three off [1]

# n = 5
# [1, 4]

# n = 10
# [1, 4, 9]

# data structure
# array containing the numbers of the switches which are on at a given moment

# algorithm
# 1. Start with an empty array
# 2. Set an outer counter to 1
# 3. Set an inner counter to start at the outer counter value
# 4. for each outer counter value
# 5. for each inner counter value
  # start with the first inner counter value
  # check to see if the inner counter value exists in the array 
    # if it does not then add that value to the array
    # if it does exist already then remove the value from the array
  # increment the inner counter by the outer counter value
# 6. Continue step 5 until the inner counter exceeds n (number given)
# 7. Continue step 4 until the outer counter exceeds n (number given)

# def light_switching(n)
#   round_num = 1
#   lights_on_arr = []
#   loop do
#     all_nums_arr = Array(1..n)
#     round_arr = all_nums_arr.select { |num| num % round_num == 0 }
#     round_arr.each do |int|
#       lights_on_arr.include?(int) ? lights_on_arr.delete(int) : lights_on_arr << int
#     end
#     round_num += 1
#     break if round_num > n
#   end
#   lights_on_arr
# end

# p light_switching(1000)

# problem 5
# input: an odd number, n
# output: a diamond output to the screen using asterisks
# must be the same number of lines as the input number, n
# largest line will be an asterisk repeated the number of times n
# smallest line will be one asterisk padded by spaces on either side
# such that it is n characters in width

# method to determine the number of asterisks
# it will return an array of integers
# same length as the diamond size parameter
# def num_asterisks(n)
#   asterisks = []
#   asterisk_qty = 1
#   threshold = (n/2) + 1
#   Array(1..n).each do |num|
#     asterisks << asterisk_qty
#     num < threshold ? asterisk_qty += 2 : asterisk_qty -= 2
#   end
#   asterisks
# end

# def diamond(n)
#   asterisk_arr = num_asterisks(n)
#   counter = 0
#   loop do
#     qty_asterisks = asterisk_arr[counter]
#     qty_spaces = (n - qty_asterisks) / 2
#     puts (" " * qty_spaces) + ("*" * qty_asterisks) + (" " * qty_spaces)
#     counter += 1
#     break if counter >= n
#   end
# end

# diamond(9)

# further exploration using their solution
# def print_row(grid_size, distance_from_center)
#   star_width = grid_size - 2 * distance_from_center
#   if star_width == 1
#     stars = '*'
#   else
#     stars = '*' + ' ' * (star_width - 2) + '*'
#   end
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

# p diamond(9)

# problem 6
# requirements
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# STACK_OPERATIONS = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP']

# def minilang(str)
#   register = 0
#   stack = []
#   error_msg = ''
#   command_arr = str.split
#   command_arr.each do |command|
#     if command == 'PUSH'               then stack << register
#     elsif command == 'PRINT'           then puts register
#     elsif STACK_OPERATIONS.include?(command)
#       if stack == []
#         error_msg = "Error: Cannot perform operation because stack is empty"
#         break
#       else
#         case command
#         when 'ADD'                       then register += stack.pop
#         when 'SUB'                       then register -= stack.pop
#         when 'MULT'                      then register *= stack.pop
#         when 'DIV'                       then register /= stack.pop
#         when 'MOD'                       then register %= stack.pop
#         when 'POP'                       then register = stack.pop
#         end
#       end
#     elsif command.to_i.to_s == command then register = command.to_i
#     else                                    
#       error_msg = "Error: #{command} is not a recognized command."
#       break
#     end
#   end
#   if error_msg != ''
#     puts error_msg
#   else
#     register
#   end
# end

# test cases
# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# (5 + 5)
# # 10
# # 4
# (4 + 3)
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# (7 / 3) * 3
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# further exploration
# (3 + (4 * 5) - 7) / (5 % 3)
# minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

# minilang ('ADD 5')

# problem 7
# NUM_STRINGS = ['zero', 'one', 'two', 'three', 'four', 
#                'five', 'six', 'seven', 'eight', 'nine']

# def word_to_digit(str)
#   NUM_STRINGS.each_with_index do |num, idx|
#     str.gsub!(/\b#{num}\b/, idx.to_s)
#   end
#   str
# end

# rewriting as a hash
# NUM_HASH = {['zero', 'Zero', 'ZERO'] => '0', ['one', 'One', 'ONE'] => '1',
#             ['two', 'Two', 'TWO'] => '2', ['three', 'Three', 'THREE'] => '3',
#             ['four', 'Four', 'FOUR'] => '4', ['five', 'Five', 'FIVE'] => '5',
#             ['six', 'Six', 'SIX'] => '6', ['seven', 'Seven', 'SEVEN'] => '7',
#             ['eight', 'Eight', 'EIGHT'] => '8', ['nine', 'Nine', 'NINE'] => '9'}

# def word_to_digit(str) 
#   NUM_HASH.each do |arr, val|
#     arr.each do |word|
#       str.gsub!(/\b#{word}\b /, val)
#       str.gsub!(/\b#{word}\b/, val)
#     end
#   end
#   str
# end

# p word_to_digit('Please call me at Five five five one two three four. Thanks.')

# # test case
# p word_to_digit('Please call me at Five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# problem 8

# def fibonacci(n)
#   return n if [0, 1].include?(n)
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# # test cases
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765


# def permutations(array)
#   return [array] if array.size == 1

#   result = []
#   array.each_with_index do |element, index|
#     sub_array = array[0...index] + array[(index + 1)..-1]
#     puts sub_array.inspect
#     sub_permutations = permutations(sub_array)
#     sub_permutations.each do |permutation|
#       result << [element] + permutation
#       # binding.pry
#     end
#   end
#   puts result.inspect
#   result
# end

# p permutations([1, 2, 3])

# problem 9
# non recursive fibonacci
# thinking through this first
# calculate fibonacci of 4
# 1: 1 (given)
# 2: 1 (given)
# 3: two_nums_ago + one_num_ago (2)
# 4: two_nums_ago + one_num_ago (3)

def fibonacci(n)
  return 1 if n <= 2
  two_before, one_before = [1, 1]
  counter = 2
  loop do
    two_before, one_before = [one_before, two_before + one_before]
    counter += 1
    break if counter == n
  end
  one_before
end

# # test cases
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

# problem 10
# part 1
# def fibonacci_last(n)
#   fibonacci(n).to_s[-1].to_i
# end

# part 2
def fibonacci_last(n)
  return 1 if n <= 2
  last_two = [1, 1]
  counter = 2
  loop do
    last_two = [last_two.last, (last_two.first + last_two.last) % 10]
    counter += 1
    break if counter == n
  end
  last_two.last
end

# test cases
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4