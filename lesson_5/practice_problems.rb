# RB101
# practice_problems

=begin
# problem 1
# order array in descending order
arr = ['10', '11', '9', '7', '8']

# my attempt
# p arr.sort_by { |num| num.to_i }.reverse

# solution
sorted_array = arr.sort do |a, b|
  b.to_i <=> a.to_i
end
p sorted_array

# problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

ordered_books = books.sort_by do |hash|
  hash[:published].to_i
end
p ordered_books

# problem 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

# problem 4
arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4
# p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4
# p arr2

hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4
# p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

# problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# p munsters["Herman"]["age"]

# person = "Herman" => { "age" => 32, "gender" => "male" }
# p person["gender"] == "male"

# sum_of_ages = 0

# munsters.each do | _, values |
#   sum_of_ages += values["age"] if values["gender"] == "male"
# end
# p sum_of_ages

# problem 6
# (Name) is a (age)-year-old (male or female).

munsters.each do | name, values |
  puts "#{name} is a #{values["age"]}-year-old #{values["gender"]}."
end

# problem 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiouAEIOU'

selected_chars = ''
hsh.each do | _, value|
  value.each do | str |
    str.chars.each do | letter |
      if vowels.include?(letter)
        selected_chars << letter
      end
    end
  end
end

p selected_chars

# problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr_sorted = 
arr.map do | subarr |
  subarr.sort do | a, b |
    b <=> a
  end
end

p arr_sorted

# problem 10

org_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
trans_array = org_array.map do | hash |
  hash.each_with_object({}) do |(key, value), new_hash|
    new_hash[key] = value + 1
  end
end

# p trans_array

# problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

trans_arr = arr.map do | subarr |
  subarr.select do | num |
    num % 3 == 0
  end
end

p trans_arr

# problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = {}
arr.each do |array|
  new_hash[array[0]] = array[1]
end

p new_hash

# problem 13
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

sorted_arr = arr.sort_by do |subarr|
  subarr.reject do |element|
    element % 2 == 0
  end
end

p sorted_arr

# problem 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# expected return value [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

arr_new = hsh.map do |(key, value)|
  case value[:type]
  when 'fruit' then value[:colors].map { |val| val.capitalize }
  when 'vegetable' then value[:size].upcase
  end
end

p arr_new

# problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

selected_hashes = arr.select do |hash|
  hash.all? do |_,value|
    value.all? { |num| num.even? }
  end
end

p selected_hashes
=end

# problem 16
# example: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
HEX_CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

# initial attempt
# def generate_uuid
#   new_uuid = ''
#   32.times do
#     new_uuid << HEX_CHARS[rand(0..15)]
#   end
#   new_uuid = new_uuid[0..7] + '-' + new_uuid[8..11] + '-' + 
#   new_uuid[12..15] + '-' + new_uuid[16..19] + '-' + new_uuid[20..31]
# end

# iterating over the hash of sections
# 8-4-4-4-12
def generate_uuid
  new_uuid = ''
  section = [8, 4, 4, 4, 12]
  section.each do |sect|
    sect.times { new_uuid << HEX_CHARS[rand(0..15)] }
    new_uuid += '-' unless new_uuid.length == 36
  end
  new_uuid
end

p generate_uuid()

