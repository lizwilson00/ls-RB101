# RB101
# exercises
# easy_2_take_2.rb

=begin
# exercise 1
puts "Please enter a name:"
name = gets.chomp
name = if name == ""
         "Teddy"
       else
         name
       end 
puts "#{name} is #{rand(20..200)} years old!"

# exercise 2
puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = (length * width).round(2)
area_sq_ft = (length * width * 10.7639).round(2)

puts "The area of the room is #{area_meters} square meters (#{area_sq_ft} square feet)."

# test case
# 10
# 7
# 70.0
# 753.47

# exercise 3
puts "What is the bill?"
bill_amt = gets.chomp.to_f

puts "What is the tip percentage?"
tip_pct = (gets.chomp.to_f)/100

tip = (bill_amt * tip_pct).round(2)
total = (bill_amt + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# test case
# 200
# 15
# $30.0
# $230.0

# exercise 4
puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

work_years = retire_age - age
curr_year = Time.now.year
retire_year = curr_year + work_years

puts "It's #{curr_year}. You will retire in #{retire_year}."
puts "You have only #{work_years} years of work to go!"

# test case
# 30
# 70
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# exercise 5
puts "What is your name?"
name = gets.chomp

if name.chars.last == "!"
  puts "HELLO #{name.upcase}.  WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# exercise 6
1.upto(99) do |num|
  puts num if num.odd?
end

# exercise 7
# evens using each
(1..99).to_a.each { |num| puts num if num.even? }

# exercise 8
puts ">> Please enter an integer greater than 0:"
int = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
selection = gets.chomp.downcase

case selection
when 's'
  total_sum = (1..int).to_a.inject(0) { |sum, num| sum + num }
  puts "The sum of the integers between 1 and #{int} is #{total_sum}."
when 'p'
  product = (1..int).to_a.inject(1) { |sum, num| sum * num }
  puts "The product of the integers between 1 and #{int} is #{product}."
else
  puts "Invalid selection"
end
=end
