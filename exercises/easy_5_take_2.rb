# RB101
# Exercises
# easy_5_take_2.rb

=begin
# exercise 1

# algorithm:
# initialize a variable sum
# iterate through each character of the string, adding the ord value of that
# character to the sum variable
# return sum

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end



# test cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# exercise 2
# algorithm
# if passed in 0 <= min < MIN_PER_DAY
  # convert min to time by dividing by MIN_PER_HR
  # quotient is hours
  # remainder is minutes
# if passed in min >= MIN_PER_DAY
  # divide min by MIN_PER_DAY
  # remainder will then need to be converted to time using the first logic


MIN_PER_HR = 60
HR_PER_DAY = 24
MIN_PER_DAY = MIN_PER_HR * HR_PER_DAY

def convert_to_time(min)
  hrs, min = min.divmod(MIN_PER_HR)
  format("%02d:%02d", hrs, min)
end

# min >= 0 && min < MIN_PER_DAY
#     convert_to_time(min)
#   elsif 

def time_of_day(min)
  if min >= 0
    convert_to_time(min % MIN_PER_DAY)
  else
    convert_to_time((MIN_PER_DAY + min) % MIN_PER_DAY)
  end
end


# formatting:
# sprintf("%g:%g", 23, 59)

# test cases
# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# exercise 3
# algorithm
# split the time which will save to an array
# convert each value to integers, save the first as hrs, second as mins
# after midnight:
# hrs * MIN_PER_HR + mins
# before midnight:
# 1440 - after_midnight

def after_midnight(time)
  hours, mins = time.split(":").map { |str| str.to_i }
  ((hours * MIN_PER_HR) + mins) % MIN_PER_DAY
end

def before_midnight(time)
  total_mins = MIN_PER_DAY - after_midnight(time)
  total_mins == MIN_PER_DAY ? 0 : total_mins
end

# test cases
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# exercise 4
def swap(string)
  word_arr = string.split(' ').map do |word| 
    word[0], word[-1] = word[-1], word[0]
    word
  end
  word_arr.join(' ')
end


# test cases
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# exercise 5
# algorithm:
# iterate through each character of the string
# replace non-alphanumeric characters with spaces
# remove multiple spaces

def cleanup(string)
  string.gsub(/[^a-zA-Z0-9]/, ' ').squeeze(' ')
end

# test cases
p cleanup("---what's my +*& line?") == ' what s my line '

# exercise 6
def word_sizes(string)
  hash = Hash.new(0)
  string.split(' ').each do |word|
    key = word.length
    hash[key] += 1
  end
  hash
end

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# exercise 7
def word_sizes(string)
  hash = Hash.new(0)
  string.split(' ').each do |word|
    key = word.gsub(/[^a-zA-Z]/, '').length
    hash[key] += 1
  end
  hash
end

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# exercise 8
ENG_NUMS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(array)
#   array.sort_by do |num|
#     ENG_NUMS[num]
#   end
# end

def alphabetic_number_sort(array)
  array.map { |num| ENG_NUMS[num] }.sort.map { |str| ENG_NUMS.index(str) }
end

# test cases
array = (0..19).to_a
p alphabetic_number_sort(array) #== [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]
p array

# exercise 9
# algorithm:
# initialize a new variable new_words = []
# split the string into words and iterate through each word
  # split the word into characters
  # initialize a new_word variable to ''
  # iterate through each character, starting with index 1..length of word - 1
  # add first character to the new_word
  # check if the character in the word matches the last character of the new_word
  # add the character to new_word if the two characters do not match
  # else next
  # increment the index by 1
# add the new_word to the new_words array

# def crunch(string)
#   new_words = []
#   string.split(' ').each do |word|
#     counter = 1
#     new_word = word[0]
#     loop do
#       break if counter >= word.length
#       new_word << word[counter] if word[counter] != new_word[-1]
#       counter += 1
#     end
#     new_words << new_word
#   end
#   new_words.join(' ')
# end

# no need to split into separate words
# remove that layer of complexity
def crunch(string)
  new_word = ''
  counter = 0
  loop do
    break if counter >= string.length
    new_word << string[counter] if string[counter] != new_word[-1]
    counter += 1
  end
  new_word
end

# test cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# exercise 10
def print_in_box(string)
  first_last = "+" + ("-" * (string.length + 2)) + "+"
  sec_forth = "|" + (" " * (string.length + 2)) + "|"
  puts first_last
  puts sec_forth
  puts "| " + string + " |"
  puts sec_forth
  puts first_last
end


# test cases
print_in_box('')

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
=end

# exercise 11


def spin_me(str)
  str.each do |word|
    word.reverse!
  end.join(" ")
end

str = ["hello", "world"]
p spin_me(str) # "olleh dlrow"
p str