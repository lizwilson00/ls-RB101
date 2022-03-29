# test.rb

=begin
array = [1, 2, 3]

p(array.map do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end)

def greetings
  yield
  puts "Goodbye"
  yield
end

word = "Hello"

greetings do
  puts word
end

a = 'hello'
2.times do
  a = 'hi'
  puts a      # 'hi' <= this will be printed out twice due to the loop
end

loop do
  puts a      # => NameError: undefined local variable or method `a' for main:Object
  break
end

puts a

a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"

a = [1, 2, 3]

# Example of a method definition that does not mutate the caller
def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"
no_mutate(a)

def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
p a

# quiz checking
response = gets.chomp
puts response

a = 2
b = rand(2)
a *= b

if a = 2
  puts 'Two'
else
  puts 'Not Two'
end

num = 8

if num >= 8 && num < 6 || num > 4
  puts 'Goodbye'
end

num = 12

if num >= 8 && num < 6 || num > 4 && num < 16
  puts 'Hello'
end

def longest_word(sentence)
  words = sentence.split
  saved_word = words.shift

  words.each do |word|
    if word.length >= saved_word.length
      saved_word = word
    end
  end

  saved_word
end

puts longest_word("Let's see if this program works the way we expect it to.")

user_input = gets
name = ''

loop do
  name = user_input
  break
end

if user_input
  puts "Hello " + name
end

def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
puts extend_greeting(greeting)

puts greeting

def name
  "George"
end

name = "Lisa"

def display_name
  puts name
end

display_name

def name
  "George"
end

name = "Lisa"

def display_name(name)
  puts name
end

display_name(name)

def name
  "George"
end

name = "Lisa"

loop do
  puts name
  break
end

def test(b)
  b.map! {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
puts test(a)
p a

def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
p s
p t
=end

def increment(x)
  x << 'b'
end
y = 'a'
increment(y)
puts y