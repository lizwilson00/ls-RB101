# RB101
# Lesson 3
# practice_easy_2.rb

=begin
# 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.include?("Spot")
puts ages.member?("Spot")
puts ages.has_key?("Spot")
puts ages.key?("Spot")

# 2
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase == "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
puts munsters_description.capitalize == "The munsters are creepy in a good way."
puts munsters_description.downcase == "the munsters are creepy in a good way."
puts munsters_description.upcase == "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# additional_ages.each do |name, num|
#   ages[name] = num
# end
# puts ages

puts ages.merge!(additional_ages)


# 4
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?("Dino")
puts advice.match?("Dino")

# 5
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Note: all three methods below mutate flintstones
# p flintstones << "Dino"
# p flintstones.push("Dino")
p flintstones.concat( ["Dino"])

# 7
# Add Dino and Hoppy
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.push("Dino", "Hoppy")
# p flintstones.concat( ["Dino", "Hoppy"])
p flintstones.concat( %w(Dino Hoppy))

# 8
advice = "Few things in life are as important as house training your pet dinosaur."
# with !
# puts advice.slice!("Few things in life are as important as ")
# puts advice

#without !
puts advice.slice("Few things in life are as important as ")
puts advice

# 9
statement = "The Flintstones Rock!"
puts statement.count("t")
=end

# 10
title = "Flintstone Family Members"
puts title.center(40)