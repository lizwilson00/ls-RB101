# RB101
# lesson_6
# tic_tac_toe.rb

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(empty_sqrs, delim = ', ', word_sep = 'or')
  case empty_sqrs.length
  when 0 then ''
  when 1 then empty_sqrs.first
  when 2 then empty_sqrs.join(" #{word_sep} ")
  else
    empty_sqrs[-1] = "#{word_sep} #{empty_sqrs.last}"
    empty_sqrs.join(delim)
  end
end

def who_goes_first?
  loop do
    prompt "Welcome to tic tac toe!"
    prompt "Who would you like to go first?"
    prompt "Choose p for player (you), c for computer, 
    or r (random) which allows the computer to choose."
    answer = gets.chomp.downcase
    if ["p", "c", "r"].include?(answer)
      return first_turn = case answer
                          when "p" then "Player"
                          when "c" then "Computer"
                          when "r" then ["Player", "Computer"].sample
                          end
    end
    prompt "Sorry, that's not a valid choice."
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def winning_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      return line.select { |num| empty_squares(brd).include?(num) }[0]
    end
  end
  nil
end

def find_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      return line.select { |num| empty_squares(brd).include?(num) }[0]
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = if winning_square(brd)
             winning_square(brd)
           elsif find_at_risk_square(brd)
             find_at_risk_square(brd)
           elsif brd[5] == INITIAL_MARKER
             5 
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_games = 0
comp_games = 0

loop do
  # 1. Display the initial empty 3x3 board.
  board = initialize_board

  # 1a. Ask the user who should go first
  if who_goes_first? == 'Player'
    prompt "Player gets to start first. Press any key to continue."
    answer2 = gets.chomp
     
    # 2. Ask the user to mark a square.
    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      # 3. Computer marks a square.
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      # If neither winner nor board is full, continue loop.
    end
  else
    prompt "Computer gets to start first. Press any key to continue."
    answer2 = gets.chomp
    loop do
      # 3. Computer marks a square.
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      # If neither winner nor board is full, continue loop.
    end
  end
  # 4. Display the updated board state.
  display_board(board)

  # 5. If winner, display winner.
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"

  else
    # 6. If board is full, display tie.
    prompt "It's a tie!"
  end

  # Increment game counter
  case detect_winner(board)
  when 'Player'
    player_games += 1
  when 'Computer'
    comp_games += 1
  end
  prompt "Current Score - Player: #{player_games}, Computer: #{comp_games}"
  prompt "Press enter to continue."
  answer = gets.chomp

  if player_games == 5 || comp_games == 5
    prompt "#{detect_winner(board)} won the match!"
    prompt "Final Score - Player: #{player_games}, Computer: #{comp_games}"
    break
  end
  # # 8. Play again?
  # prompt "Play again? (y or n)"
  # answer = gets.chomp
  # # 9. If yes, loop back through to play another game.
  # break unless answer.downcase.start_with?('y')
end

# 10. Good bye!
prompt "Thanks for playing Tic Tac Toe!  Goodbye!"
