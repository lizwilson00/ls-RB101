# RB101
# Lesson 2
# calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_int?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_int?(num) || valid_float?(num)
end

def operation_to_message(op)
  word = case op
        when '1'
          'Adding'
        when '2'
          'Subtracting'
        when '3'
          'Multiplying'
        when '4'
          'Dividing'
        end
  word
end

# Welcomes the user
prompt(MESSAGES['welcome'])

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  # Asks user to enter two numbers
  num1 = ''
  loop do
    prompt(MESSAGES['num_prompt1'])
    num1 = Kernel.gets().chomp
    
    if number?(num1)
      break
    else
      prompt(MESSAGES['num_invalid'])
    end
  end
  
  num2 = ''
  loop do
    prompt(MESSAGES['num_prompt2'])
    num2 = Kernel.gets().chomp
    
    if number?(num2)
      break
    else
      prompt(MESSAGES['num_invalid'])
    end
  end
  
  # Asks user to enter the operator
  operator_prompt = <<-MSG 
  What operation would you like to perform?  Valid values are:
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  
  prompt(operator_prompt)
  
  oper = ''
  loop do
    oper = Kernel.gets().chomp
    if %w(1 2 3 4).include?(oper)
      break
    else
      prompt(MESSAGES['oper_invalid'])
    end
  end
  
  prompt("#{operation_to_message(oper)} the two numbers...")
  
  # Calculates the result of the operation
  result =  case oper
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            end
  # Prints out the result to the user
  prompt("The result is #{result}")
  prompt(MESSAGES['perform_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
