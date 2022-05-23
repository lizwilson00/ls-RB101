# RB101
# exercises
# easy_9.rb

=begin
# problem 1
def greetings(arr, hash)
  str = "Hello, #{arr.join(' ')}! Nice to have a " +
        "#{hash[:title]} #{hash[:occupation]} around."
  puts str
end

# test cases
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# problem 2
def double_num?(num)
    num_str = num.to_s
    num_len = num_str.length
    mid_idx = num_len / 2
    num_str[0..(mid_idx - 1)] == num_str[mid_idx..num_len] && num_len.even?
end

def twice(num)
  if double_num?(num)
    num
  else
    num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# problem 3
def negative(num)
  num > 0 ? -num : num
end

# test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# problem 4
def sequence(int)
  int < 0 ? (int..-1).to_a : (1..int).to_a
end

# test cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [-1]
p sequence(-6) == [-6, -5, -4, -3, -2, -1]

# problem 5
def uppercase?(str)
  str_arr = str.chars.select { |s| s =~ /[a-zA-Z]/ }
  str_arr.all?(/[A-Z]/)
end

# test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# problem 6
def word_lengths(str)
  str_arr = str.split
  str_arr.map do |word|
    "#{word} #{word.length}"
  end
end

# test cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# problem 7
def swap_name(full_name)
  name_arr = full_name.split
  "#{name_arr[1]}, #{name_arr[0]}"
end

# test case
p swap_name('Joe Roberts') == 'Roberts, Joe'

# problem 8
def sequence(cnt, start_val)
  seq_arr = []
  run_tot = start_val
  1.upto(cnt) do
    seq_arr << run_tot
    run_tot += start_val
  end
  seq_arr
end

# test cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# problem 9 
def get_grade(gr1, gr2, gr3)
  avg = (gr1 + gr2 + gr3) / 3.0
  case
  when avg >= 90
    "A"
  when avg >= 80
    "B"
  when avg >= 70
    "C"
  when avg >= 60
    "D"
  else
    "F"
  end
end

# test cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(85, 82.3, 100) == "B"

# problem 10
def buy_fruit(arr)
  list_arr = []
  arr.each do |fruit, qty|
    qty.times { list_arr << fruit }
  end
  list_arr
end

# test case
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end

# problem 11
# def letter_hash(str)
#   letter_hash = {}
#   str.chars.each do |letter|
#     letter_hash.key?(letter)? letter_hash[letter] += 1 : letter_hash[letter] = 1
#   end
#   letter_hash
# end

# # p letter_hash('demo') == letter_hash('mode')

# def anagrams(arr)
#   arr.each do |str|
#     anagram_list = []
#     str_hash = letter_hash(str)
#     arr.each do |str2|
#       anagram_list << str2 if str_hash == letter_hash(str2)
#     end
#     p anagram_list
#   end
# end

# rewriting using the sort methodology from the solution
def anagrams(arr)
  arr.each do |word|
    anagram_list = []
    sorted_word = word.split('').sort.join
    arr.each do |word2|
      anagram_list << word2 if sorted_word == word2.split('').sort.join
    end
    p anagram_list
  end
end

# test case
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

anagrams(words)