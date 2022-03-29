# rock_paper_scissors2.rb

VALID_CHOICES = ['r', 'p', 'sc', 'l', 'sp']

WIN_RULE_HASH = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_RULE_HASH[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def choice_to_word(abbrev_choice)
  word =  case abbrev_choice
          when 'r'
            'rock'
          when 'p'
            'paper'
          when 'sc'
            'scissors'
          when 'l'
            'lizard'
          when 'sp'
            'spock'
          end
  word
end

pl_win_cnt = 0
comp_win_cnt = 0
pl_win = false

loop do
  choice = ''
  loop do
    prompt("++++++++++++++++Game on++++++++++++++++++++++++++")
    prompt("Choose one: r - rock, p - paper, sc - scissors," \
    " l - lizard, or sp - spock")
    choice = Kernel.gets().chomp().downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  pl_choice = choice_to_word(choice)
  
  comp_choice = choice_to_word(VALID_CHOICES.sample())

  prompt("You chose: #{pl_choice};" \
  " Computer chose: #{comp_choice}")

  prompt(display_results(pl_choice, comp_choice))

  #Increment appropriate counter
  if win?(pl_choice, comp_choice)
    pl_win_cnt += 1
  elsif win?(comp_choice, pl_choice)
    comp_win_cnt += 1
  end
  
  #Break out of loop once one of the counters has reached 3
  pl_win = true if pl_win_cnt == 3
  break if (pl_win_cnt == 3 || comp_win_cnt == 3)
  
  #Otherwise continue
  prompt("The score is player: #{pl_win_cnt}, computer: #{comp_win_cnt}." \
  " Let's play again.")
  # prompt("Do you want to play again?")
  # answer = Kernel.gets().chomp()
  # break unless answer.downcase().start_with?('y')
end

prompt("++++++++++++++++Game over++++++++++++++++++++++++")
if pl_win == true
  prompt("Congratulations - you won!!!!")
else
  prompt("Sorry, the computer won this time.")
end

prompt("The final score was player: #{pl_win_cnt}, computer: #{comp_win_cnt}.")
prompt("Thank you for playing.  Good bye!")
