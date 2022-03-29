# mortgage_calc.rb

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
  (valid_int?(num) || valid_float?(num)) && (num.to_f > 0)
end

def percent?(pct)
  pct.to_f < 100
end

# Welcomes the user
prompt "Welcome to the mortgage calculator!  Enter your name."

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  # Ask for the loan amount
  loan_amt = ''
  loop do
    prompt("Please enter the loan amount.")
    loan_amt = Kernel.gets().chomp
    if number?(loan_amt)
      break
    else
      prompt("That doesn't look like a valid loan amount.
      Please enter a loan amount greater than zero.")
    end
  end

  # Ask for the APR (percentages)
  apr = ''
  loop do
    prompt("Please enter the Annual Percentage Rate (APR) as a percentage.
    Example: Enter 5.25 for 5.25%.")
    apr = Kernel.gets().chomp
    if number?(apr) && percent?(apr)
      break
    else
      prompt("That doesn't look like a valid APR.
      Please enter an APR greater than 0 but less than 100.")
    end
  end

  # Ask for the loan duration (years)
  loan_dur = ''
  loop do
    prompt("Please enter the loan duration in years.")
    loan_dur = Kernel.gets().chomp
    if number?(loan_dur)
      break
    else
      prompt("Hmm...that doesn't look like a valid loan duration.")
    end
  end

  # Calculations
  mon_apr = apr.to_f / 1200
  mon_loan_dur = loan_dur.to_f * 12
  mon_pmt = loan_amt.to_f * (mon_apr / (1 - (1 + mon_apr)**(-mon_loan_dur)))

  # Prints out the result to the user
  prompt("Monthly payment: $#{mon_pmt.round(2)}.")
  prompt("Monthly APR: #{(mon_apr * 100).round(2)}%")
  prompt("Number of months: #{mon_loan_dur}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the mortgage calculator!")
