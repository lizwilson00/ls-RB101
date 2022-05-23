# RB101 Exercises
# easy_5.rb

=begin
# problem 1
# ASCII values
def ascii_value(string)
  counter = 0
  sum = 0
  while counter < string.length
    sum += string[counter].ord
    counter += 1
  end
  sum
end

# using each_char
def ascii_value(string)
  sum = 0
  string.each_char { |s| sum += s.ord }
  sum
end


# test cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# problem 2
# counting before and after midnight

# first attempt
# def calc_hours_neg(hours, mins)
#   return 0 if hours == 0 and mins == 0
#   if mins > 0
#     new_hours = 23 - hours
#   else
#     new_hours = 24 - hours
#   end
#   new_hours
# end

# def time_of_day(int)
#   mins_tot = int.abs
#   hours, mins = mins_tot.divmod(60)
#   hours = hours % 24 if hours > 23
#   if int < 0
#     hours = calc_hours_neg(hours, mins)
#     mins = 60 - mins if mins > 0
#   end
#   format('%02d:%02d', hours, mins)
# end


# solution
# MINS_IN_HOUR = 60
# HOURS_IN_DAY = 24
# MINS_IN_DAY = MINS_IN_HOUR * HOURS_IN_DAY

# def normalize_mins(mins)
#   while mins < 0
#     mins += MINS_IN_DAY
#   end
  
#   mins % MINS_IN_DAY
# end

# def time_of_day(delta_mins)
#   delta_mins = normalize_mins(delta_mins)
#   hours, mins = delta_mins.divmod(MINS_IN_HOUR)
#   format('%02d:%02d', hours, mins)
# end

# if you can use date and time
# MIDNIGHT = Time.new(2022, 3, 21)

# def time_of_day(int)
#   new_time = MIDNIGHT + (int * 60)
#   new_time.strftime("%H:%M")
# end

# counting back from Saturday night / Sunday morning
# 3/20/2022 is a Sunday
MIDNIGHT = Time.new(2022, 3, 20)
# strftime
def time_of_day(int)
  new_time = MIDNIGHT + (int * 60)
  new_time.strftime("%A, %H:%M")
end

p time_of_day(-4231)

# test cases
# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# problem 3
# def after_midnight(time)
#   hours, mins = time.split(':').map { |str| str.to_i }
#   total_mins = ((hours * 60) + mins) % 1440
# end

# def before_midnight(time)
#   total_mins = 1440 - after_midnight(time)
#   total_mins = 0 if total_mins == 1440
#   total_mins
# end

# if allowed to use date and time classes
MIDNIGHT = Time.new(2022, 3, 20)

def after_midnight(time)
  hours, mins = time.split(':').map { |str| str.to_i }
  total_mins = (Time.new(2022, 3, 20, hours, mins) - MIDNIGHT) / 60
  total_mins % 1440
end

def before_midnight(time)
  total_mins = 1440 - after_midnight(time)
  total_mins = 0 if total_mins == 1440
  total_mins
end


# test cases
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:00') == 720
p before_midnight('12:34') == 686
p before_midnight('23:50') == 10
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# problem 4
# Reverse first and last letters of each word within a string
# def rev_first_last(string)
#   new_string = string[-1] + string[1..-2] + string[0]
#   new_string = string if string.length == 1
#   new_string
# end

# refactoring rev_first_last
def rev_first_last(string)
  string[0], string[-1] = string[-1], string[0]
  string
end

def swap(string)
  words = string.split(' ').map { |str| rev_first_last(str) }
  updated_string = words.join(' ')
end

# test cases
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# problem 5
# clean up special characters

# def cleanup(string)
#   invalid_chars = /[^a-z]/
#   counter = 0
#   while counter < string.length
#     string[counter] = ' ' if string[counter] =~ invalid_chars
#     counter += 1
#   end
#   string.squeeze(" ")
# end

# shorter
def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# test case
p cleanup("---what's my +*& line?") == ' what s my line '

# problem 6
# word letter counter
def word_sizes(string)
  word_size_hash = Hash.new(0)
  string.split.each do |word|
    word_size_hash[word.length] += 1
  end
  word_size_hash
end

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# problem 7
# word letter counter no special characters

def word_sizes(string)
  word_size_hash = Hash.new(0)
  string.split.each do |word|
    word_no_spec_chars = word.delete('^a-zA-Z')
    word_size_hash[word_no_spec_chars.length] += 1
  end
  word_size_hash
end

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

# problem 8
# alphabetical numbers

# first attempt
# NUM_TO_WORD = { 0=>'zero', 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five',
# 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine', 10=>'ten', 11=>'eleven', 
# 12=>'twelve', 13=>'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen',
# 17=>'seventeen', 18=>'eighteen', 19=>'nineteen' }
# WORD_TO_NUM = NUM_TO_WORD.each_with_object({}) do |(key, value), hash|
#   hash[value] = key
# end

# def alphabetic_number_sort(array)
#   # convert to words
#   word_array = array.map { |num| NUM_TO_WORD[num] }
#   word_array.sort!
#   sorted_array = word_array.map { |word| WORD_TO_NUM[word] }
# end

# after seeing solution
NUM_WORDS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, 
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, 
nineteen)

# def alphabetic_number_sort(array)
#   array.sort_by { |num| NUM_WORDS[num] }
# end

# rewrite using sort
def alphabetic_number_sort(array)
  word_array = NUM_WORDS.sort
  word_array.map { |word| NUM_WORDS.index(word) }
end

p alphabetic_number_sort((0..19).to_a)

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# problem 9
# remove repeating letters
def crunch(string)
  new_string = ''
  counter = 0
  while counter < string.length
    new_string << string[counter] unless string[counter] == new_string[-1]
    counter += 1
  end
  new_string
end

# test cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# more exploration needed here....

# problem 10
# bannerizer
# my first attempt
def red(mytext) 
  "\e[31m#{mytext}\e[0m" 
end

# def print_in_box(string)
#   first_word = string.partition(" ")[0]
#   last_section = string.partition(" ")[1] + string.partition(" ")[2]
#   print "+-"
#   string.length.times { |_| print "-" } if string.length > 0
#   print "-+\n"
#   print "|"
#   (string.length + 2).times { |_| print " " } 
#   print "|\n| " + red(first_word) + last_section + " |\n|"
#   (string.length + 2).times { |_| print " " } 
#   print "|\n+-"
#   string.length.times { |_| print "-" } if string.length > 0
#   print "-+\n"
# end

# after looking at solution
def print_in_box(string)
  first_word = string.partition(" ")[0]
  last_section = string.partition(" ")[1] + string.partition(" ")[2]
  plus_dash_line = "+#{"-" * (string.length + 2)}+"
  pipe_line = "|#{" " * (string.length + 2)}|"

  puts plus_dash_line
  puts pipe_line
  puts "| #{red(first_word) + last_section} |"
  puts pipe_line
  puts plus_dash_line
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('Testing to make sure this works')

print_in_box('')

# more exploration needed here....
=end

# problem 11
# spin me around in circles

def spin_me(str)
  str.split.each do |word|
    word.reverse
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"