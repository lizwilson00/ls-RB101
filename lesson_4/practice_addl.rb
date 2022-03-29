# RB101
# Lesson 4
# practice_addl.rb

=begin
#problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values 
# are the positions in the array

# input: array
# output: hash

# first attempt
arr = []

flintstones.each_with_index do |name, index|
  arr << [name, index]
end

p arr.to_h

# another way
hash = {}

flintstones.each_with_index do |name, index|
  hash[name] = index
end

p hash

# problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# add up all the ages
# first attempt
#p ages.values.sum

# using each
total_ages = 0
ages.each do |(key, value)|
  total_ages += value
end

p total_ages

# problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with ages > 100

# first attempt
# ages_mod = ages.select do |_, age|
#   age.to_i < 100
# end

# p ages_mod

# keep if
ages_mod = ages.keep_if { |_, age| age.to_i < 100 } 

p ages_mod

# problem 4

# find the minimum age
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

# my attempt
# counter = 0

# loop do
#   puts counter if flintstones[counter].slice(0,2) == 'Be'
#   counter += 1
#   break if counter == flintstones.size
# end

# using index
p flintstones.index { |name| name.slice(0,2) == 'Be' }
p flintstones.index { |name| name[0,2] == 'Be' }

# problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0,3] }

# problem 7
statement = "The Flintstones Rock"

# input: string
# output: hash

# Problem:
# Explicit Requirements
# Create a hash that expresses the frequency with which each letter occurs in this string

# Implicit Requirements
# Assumptions:
# Upper case and lower case letters are unique from each other
# Ex: T will have a different key as t
# Spaces will be removed (based on the example provided)
# Other special characters will be included (ex: period (.), apostrophe ('))

# Data structure/Algorithm
# Create an array of the unique characters in the string and store as an array
# Remove spaces from the string
# Initialize an empty array
# Iterate through each character of the string, add the character to the array if it doesn't already exist
# Initialize an empty hash
# Iterate through each character of the array
# Add the following key/value pair to the hash: 
#   key: character being iterated on
#   value: count of the number of times the character appears in the string
# Return the hash

# my attempt
# statement.delete!(" ")

# char_arr = []
# counter = 0

# loop do
#   current_char = statement[counter]

#   if !char_arr.include?(current_char)
#     char_arr << current_char    # appends current_char into the char_arr array if it isn't already there
#   end

#   counter += 1
#   break if counter == statement.size
# end

# hash_final = {}
# counter = 0

# loop do
#   current_char = char_arr[counter]

#   hash_final[current_char] = statement.count(current_char)
  
#   counter += 1
#   break if counter == char_arr.size
# end

# p hash_final

# after looking at solution
hash_final = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  if statement.include?(letter)
    hash_final[letter] = statement.count(letter)
  end
end

p hash_final

# problem 8
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# problem 9
# Write a method that capitalizes each word of a phrase
# My attempt
def titleize(words)
  words_arr = words.split
  words_arr.map { |word| word.capitalize! }
  final_phrase = words_arr.join(" ")
end

phrase = "testing to see if this works"
p titleize(phrase)

# Combining into one line (after looking at solution)
words = "the flintstones rock"
p words.split.map { |word| word.capitalize }.join(' ')
=end

# problem 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters

# input: hash
# output: hash

# Explicit Requirement
# add age_group key with one of three values based on the individual's age

# Implicit Requirement
# the output hash can be a new hash (input hash does not need to be mutated)


# create an array containing the keys to the munsters hash (individuals)
# iterate through each item in the above array to retrieve each individual's hash
# retrieve the value associated with the age key in that hash
# add a new key-value pair to the hash
# key will be age_group
# value will be based on the age that was found:
  # kid 0-17
  # adult 18-64
  # senior 65+
  
# munsters_ind = munsters.keys
munsters.each do |(key, value)|
  if value["age"].between?(0,17)
    value["age_group"] = "kid"
  elsif value["age"].between?(18,64)
    value["age_group"] = "adult"
  elsif value["age"] > 64
    value["age_group"] = "senior"
  else
    value["age_group"] = "invalid age"
  end
end

p munsters
    