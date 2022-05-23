# RB101
# exercises
# medium_1_take_2.rb

=begin
# exercise 1
# problem: without modifying the input array, 
# move the first element to the end of the array

# algorithm
# return index 1..-1 + index 0

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# test cases
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# rotate string
def rotate_string(str)
  str[1..-1] + str[0]
end

# p rotate_string('abc') == 'bca'

# rotate integer
def rotate_int(int)
  rotate_string(int.to_s).to_i
end

# p rotate_int(1234) == 2341

# exercise 2

# algorithm
# convert the number passed in to a string, split it into its characters
# save it to an array
# pass the last x number of digits (where x is the 2nd argument passed in)
# to the rotate_array method
# add this result back to the remaining array
# join the characters together and convert back to an integer

def rotate_rightmost_digits(int, num_rot)
  int_arr = int.to_s.chars
  int_arr[-num_rot..-1] = rotate_array(int_arr[-num_rot..-1])
  int_arr.join.to_i
end


# test cases
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# exercise 3
# problem
# rotate full number
# rotate number except for 1st digit
# rotate number except for first 2 digits
# and so forth until you rotate the final 2 digits
# return the resulting number

# algorithm
# initialize a variable current_num
# initialize a variable num of rotations to length of the num
# increment from 0 through length of num - 2
# call rotate_rightmost_digits on the num with num of rotations
# decrement num of rotations 
# call rotate_rightmost_digits on the num index 1..-1 with num of rotations
# break after rotate method has been called with num of rotations == 2

def max_rotation(int)
  num_rotations = int.to_s.length
  rotated_num = int
  loop do
    rotated_num = rotate_rightmost_digits(rotated_num, num_rotations)
    num_rotations -= 1
    break if num_rotations < 2
  end
  rotated_num
end

# test cases
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# exercise 4
# problem: given n light switches
# return an array of the light switches that are on after n passes through the switches
# on the nth pass you toggle each switch that is divisible by n

# input: integer
# output: array

# data structure: hash

# iterate from 1..n
# on first pass:
  # add each number to the hash with a value of "on"
# on second pass:
  # update numbers that are divisible by 2
    # if the value is "on", change to "off"
    # if the value is "off", change to "on"
# on third pass:
  # follow same logic as 2
# continue until the nth pass has been completed
# return the keys of the hash where the value is "on"

def light_switches(int)
  # initialize the hash
  light_hash = {}
  1.upto(int) { |num| light_hash[num] = "off" }
  1.upto(int) do |pass|
    1.upto(int) do |switch|
      if switch % pass == 0
        if light_hash[switch] == "off"
          light_hash[switch] = "on"
        elsif light_hash[switch] == "on"
          light_hash[switch] = "off"
        end
      end
    end
  end
  light_hash.select { |_,val| val == "on" }.keys
end

# test cases
# p light_switches(2)
p light_switches(5) #== [1, 4]
p light_switches(10) #== [1, 4, 9]

# exercise 5

# algorithm
# iterate from num/2 down to 0, call this the distance from the middle
# print '*' * (num - (dist*2))
# iterate from 1 to num/2 
# print '*' * (num - (dist*2))

def diamond(num)
  half = num/2
  half.downto(0) do |dist_from_mid|
    puts ("*" * (num - (dist_from_mid*2))).center(num)
  end
  1.upto(half) do |dist_from_mid|
    puts ("*" * (num - (dist_from_mid*2))).center(num)
  end
end

diamond(9)

# exercise 6 
# problem:
# given a string of numbers and commands,
# output the result of those numbers and commands 
# as given by the rules.

# rules:
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# algorithm:
# initialize a register variable to 0
# initialize an empty array stack
# split the string into separate numbers and commands, store to an array
# iterate through the array, one item at a time
# execute the appropriate rule based on the value of the element
# output if directed by the rules

def minilang(string)
  register = 0
  stack = []
  directions = string.split(' ')
  directions.each do |command|
    if command.to_i.to_s == command then register = command.to_i
    elsif command == 'PUSH' then stack.push(register)
    elsif command == 'ADD' then register += stack.pop
    elsif command == 'SUB' then register -= stack.pop
    elsif command == 'MULT' then register *= stack.pop
    elsif command == 'DIV' then register /= stack.pop
    elsif command == 'MOD' then register %= stack.pop
    elsif command == 'POP' then register = stack.pop
    elsif command == 'PRINT' then puts register
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# exercise 7
# word to digit

# DIGITS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(string)
#   new_string = string
#   DIGITS.each do |word|
#       new_string = string.gsub(word, DIGITS.index(word).to_s)
#     end
#   new_string
# end

# # test case
# p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# exercise 8
def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# exercise 9
# algorithm:
# if n (number passed in) is 1 or 2 then return 1
# else:
# initialize a last_two array to [1, 1]
# iterate from 3 to n
# replace the value in the 2nd position of the last_two array 
# with the sum of the last_two array
# once n has been reached, return the last value in the last_two array

def fibonacci(n)
  return 1 if n < 3
  last_two = [1, 1]
  3.upto(n) do
    last_two[0], last_two[1] = last_two[1], last_two.sum
  end
  last_two.last
end

p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
=end

# exercise 10
def fibonacci_last(n)
  return 1 if n < 3
  last_two = [1, 1]
  3.upto(n) do
    last_two[0], last_two[1] = last_two[1], last_two.sum % 10
  end
  last_two.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
