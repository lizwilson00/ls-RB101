# RB101 Exercises
# easy_2.rb

=begin
#1
puts "What is your name?"
name = gets.chomp
name = "Teddy" if name.empty?
rand_age = rand(20...200)
puts "#{name} is #{rand_age} years old!"

#2
SQMETERS_TO_SQFEET = 10.7639
puts "Enter the length of the room in meters:"
len = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f
area_meters = (len * width).round(2)
area_sq_ft = (area_meters * SQMETERS_TO_SQFEET).round(2)
puts "The area of the room is #{area_meters} " + \
"square meters (#{area_sq_ft} square feet)."

# 2: Further Exploration
#Conversions
SQFEET_TO_SQMETERS = 0.092903
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCMS = 929.03

puts "Enter the length of the room in feet:"
len = gets.chomp.to_f

puts "Enter the width of the room in feet:"
width = gets.chomp.to_f

area_sq_feet = (len * width).round(2)
area_sq_meters = (area_sq_feet * SQFEET_TO_SQMETERS).round(2)
area_sq_in = (area_sq_feet * SQFEET_TO_SQINCHES).round(2)
area_sq_cm = (area_sq_feet * SQFEET_TO_SQCMS).round(2)

puts "The area of the room is:
 - #{area_sq_feet} square feet
 - #{area_sq_meters} sqare meters
 - #{area_sq_in} square inches
 - #{area_sq_cm} square centimeters"

# 3 Tip Calculator
def prompt(message)
  puts "=>> #{message}"
end

# Ask for the bill amount and tip percentage
prompt("What is the total bill?")
bill_total = gets.chomp.to_f

prompt("What is the tax percentage?")
tax_pct = gets.chomp.to_f

prompt("What is the tip percentage?")
tip_pct = gets.chomp.to_f

# Calculate tip and total
pre_tax_total = (1-(tax_pct/100)) * bill_total
tip = (pre_tax_total * (tip_pct/100)).round(2)
total_with_tip = (bill_total + tip).round(2)

#Output the tip and total amounts
prompt("The tip is #{sprintf("$%2.2f", tip)}")
prompt("The total is #{sprintf("$%2.2f", total_with_tip)}")

# 4 Retirement 
t = Time.now
YEAR = t.year

def prompt(message)
  puts "=>> #{message}"
end

prompt("What is your age?")
curr_age = gets.chomp

prompt("At what age would you like to retire?")
retire_age = gets.chomp

# Calculate retirement year
num_years_work = retire_age.to_i - curr_age.to_i
retire_year = num_years_work + YEAR

prompt("It's #{YEAR}. You will retire in #{retire_year}.
You have only #{num_years_work} years of work to go!")

# 5 Name with exclamation point
puts "What is your name?"
name = gets.chomp
if name[-1] == "!"
  name = name.chomp!("!")
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hi #{name}."
end

#6 Odd Numbers
#(1..99).each {|num| puts num if num % 2 != 0}

#using while loop
# num = 1
# while num < 100
#   puts num
#   num += 2
# end

#using Integer#upto 
#1.upto(99) {|i| puts i if i.odd? == true }

#using Array#select
a = (1..99).to_a
a.select {|i| puts i if i.odd? == true }

#7 Even Numbers
#(1..99).each {|num| puts num if num % 2 == 0}

#using while loop
# num = 2
# while num < 100
#   puts num
#   num += 2
# end

#using Integer#upto 
#1.upto(99) {|i| puts i if i.even? == true }

#using Array#select
# a = (1..99).to_a
# a.select {|i| puts i if i.even? == true }

#in one line
(1..99).to_a.select {|i| puts i if i.even? == true }

#8 Sum or Product of Consecutive Integers
def prompt(message)
  puts(">> #{message}")
end

# old
# def sum(max_num)
#   value = 1
#   total = 0
#   while value <= max_num
#     total += value
#     value += 1
#   end
#   return total
# end

# def product(max_num)
#   value = 1
#   total = 1
#   while value <= max_num
#     total *= value
#     value += 1
#   end
#   return total
# end

# refactored
# def sum(max_num)
#   total = 0
#   1.upto(max_num) { |val| total += val }
#   total
# end

# def product(max_num)
#   total = 1
#   1.upto(max_num) { |val| total *= val }
#   total
# end

# refactored with inject
def sum(max_num)
  (1..max_num).inject { |val, n| val + n }
end

def product(max_num)
  (1..max_num).inject { |val, n| val * n }
end

prompt("Please enter an integer greater than 0:")
int = Kernel.gets().chomp().to_i

prompt("Enter 's' to computer the sum, 'p' to compute the product.")

operation = ''
loop do
  operation = Kernel.gets().chomp().downcase
  if operation != 's' && operation != 'p'
    prompt("Please enter either 's' or 'p'.")
  else
    break
  end
end

if operation == 's'
  prompt("The sum of the integers between 1 and #{int} is #{sum(int)}.")
elsif operation == 'p'
  prompt("The product of the integers between 1 and #{int} is #{product(int)}.")
else
  prompt("Something went wrong.")
end
=end

#9 String Assignment
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

