# RB101
# Lesson 3
# practice_easy_1.rb

=begin
# Question 2
# what is != and where should you use it?
# use in conditional tests when looking for something other than that value
if 1 != 2
  puts "1 is not equal to 2"
else
  puts "1 is equal to 2"
end

# put ! before something, like !user_name
# this is not the best example because it is confusing
user_name = 'username'
if user_name == 'lizwilson'
  valid = true
else
  valid = false
end

if !valid == true
  puts "You entered an invalid user name."
end

# put ! after something, like words.uniq!
# this mutates the caller
words = "I need to remember to cancel glo today".split
p words
#doesn't mutate the array
words.uniq 
puts "without the bang:"
p words

#mutates the array
words.uniq!
puts "without the bang:"
p words

# put ? before something
# ternary operator
#1 + 1 == 2 ? (puts "1 + 1 = 2 is true") : (puts "1 + 1 = 2 is not true")

# put ? after something
# depends on what it's after...usually would return a boolean
# a = [ "a", "b", "c" ]
# puts a.include?("b") => true  

# put !! before something, like !!user_name
#returns true (not not)
# user_name = 'username'
# puts !!user_name => true


# Question 3
# My attempt
advice = "Few things in life are as important as house training your pet dinosaur."
advice_new = advice.split.each do |word|
  word.replace('urgent') if word == 'important'
end
puts advice_new.join(" ")

# Solution
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!("important", "urgent")

# Question 5
# Programmatically determine if 42 lies between 10 and 100.

puts (10..100).include?(42)
puts (10..100).cover?(42)

# Question 6
famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.
puts "Four score and " + famous_words
puts "Four score and " << famous_words
puts famous_words.prepend("Four score and ")

# Question 7
nested_array = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
p nested_array.flatten
=end

# Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flint_arr = flintstones.to_a
p flint_arr
barney_arr = flint_arr[2]
p barney_arr

#p flintstones.assoc("Barney")

