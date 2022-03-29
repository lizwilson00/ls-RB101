# RB101
# Lesson 3
# practice_medium_1.rb

=begin
# 1
10.times { |num| puts (' ' * num) + "The flintstones rock!" }

# 2
# this code is not working
# puts "the value of 40 + 2 is " + (40 + 2)
# this code works!
puts "the value of 40 + 2 is #{(40 + 2)}"

# another way
puts "the value of 40 + 2 is " + (40 + 2).to_s

# 3
# original code
# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# one possible solution
# but is not a change to the loop
def factors(number)
  return "invalid number" if number < 1
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# another possible solution
# with a change to the loop
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end


p factors(0)
p factors(1)
p factors(12)

# 4
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

array = %w(a b c d e)

# p rolling_buffer1(array, 5, 'f')
# ["b", "c", "d", "e", "f"]
# p array
# ["b", "c", "d", "e", "f"]
# p rolling_buffer2(array, 5, 'f')
# ["b", "c", "d", "e", "f"]
# p array
# ["a", "b", "c", "d", "e"]

# 5
limit = 15

def fib(first_num, second_num, lim)
  while first_num + second_num < lim
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# 6
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)

p munsters

# 8
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
=end

# 9 
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)