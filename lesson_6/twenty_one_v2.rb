# RB101
# lesson_6
# twenty_one_v2.rb

SUM_TARGET = 21
DEALER_THRESHOLD = 17

INITIAL_DECK = [['H', 'A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'],
                ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'],
                ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['D', 'A'], ['D', '2'],
                ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'],
                ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
                ['D', 'K'], ['C', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
                ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'],
                ['C', '10'], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['S', 'A'],
                ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'],
                ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'],
                ['S', 'Q'], ['S', 'K']]

CARD_VALUES = { 'A' => 11, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10,
                'K' => 10 }

CARD_TRANSLATIONS = { 'A' => 'Ace', 'J' => 'Jack', 'Q' => 'Queen',
                      'K' => 'King', 'S' => 'Spades', 'H' => 'Hearts',
                      'D' => 'Diamonds', 'C' => 'Clubs' }

def prompt(msg)
  puts "=> #{msg}"
end

def calculate_total(hand)
  num_aces = hand.select { |card| card[1] == 'A' }.length
  sum = 0
  hand.each { |card| sum += CARD_VALUES[card[1]] }
  while sum > SUM_TARGET && num_aces > 0
    sum -= 10
    num_aces -= 1
  end
  sum
end

def busted?(score)
  score > SUM_TARGET
end

def dealer_final_hand!(dealer_hand, dealer_score, current_deck)
  puts "--------------"
  loop do
    prompt "Dealer's hand: #{dealer_hand}, Dealer's score: #{dealer_score}"
    prompt "Dealer busts!" if dealer_score > SUM_TARGET
    break if dealer_score >= DEALER_THRESHOLD
    dealer_hand << current_deck.pop
    dealer_score = calculate_total(dealer_hand)
  end
  puts "--------------"
  return dealer_hand, dealer_score
end

def detect_winner(dealer_score, player_score)
  if player_score > SUM_TARGET
    'Dealer'
  elsif dealer_score > SUM_TARGET
    'Player'
  elsif dealer_score < player_score
    'Player'
  elsif dealer_score > player_score
    'Dealer'
  else
    'Tie'
  end
end

def display_who_won(dealer_score, player_score)
  result = detect_winner(dealer_score, player_score)
  case result
  when 'Dealer'
    prompt "Sorry, you lost this round."
  when 'Player'
    prompt "You won! Congrats!"
  when 'Tie'
    prompt "It was a tie!"
  end
end

def display_end_of_round(dealer_hand, dealer_score, player_hand, player_score)
  puts "=============="
  display_who_won(dealer_score, player_score)
  prompt "Dealer had #{dealer_hand}, Dealer's score: #{dealer_score}"
  prompt "Player had #{player_hand}, Player's score: #{player_score}"
  puts "=============="
end

player_games = 0
dealer_games = 0

prompt "Welcome to Twenty-One!"

loop do
  # 1. Initialize variables
  current_deck = INITIAL_DECK.shuffle
  dealer_hand = []
  player_hand = []

  # 2. Deal cards to player and dealer
  2.times do
    dealer_hand << current_deck.pop
    player_hand << current_deck.pop
  end

  dealer_score = calculate_total(dealer_hand)
  player_score = calculate_total(player_hand)
  prompt "The dealer's card is the #{dealer_hand.first}."
  prompt "Your hand: #{player_hand}"
  prompt "Your score: #{player_score}"

  # 3. Player turn: hit or stay
  loop do
    # 3.1. ask "hit" or "stay"
    prompt "Would you like to hit or stay?"
    prompt "Type 'hit' for hit or 'stay' for stay."
    answer = gets.chomp.downcase
    # 3.2. if "stay", stop asking
    if answer == 'stay'
      break
    elsif answer == 'hit'
      player_hand << current_deck.pop
      player_score = calculate_total(player_hand)
      break if busted?(player_score)
      prompt "Your hand: #{player_hand}"
      prompt "Your score: #{player_score}"
    else
      prompt "Sorry, must enter 'hit' or 'stay'."
    end
  end

  # 4. Determine winner and display results
  # if player busted
  if busted?(player_score)
    prompt "Your hand: #{player_hand}.  You busted."
  # player didn't bust, determine dealer's hand and score
  else
    prompt "Your score: #{player_score}."
  end

  dealer_hand, dealer_score = dealer_final_hand!(dealer_hand, dealer_score,
                                                 current_deck)
  display_end_of_round(dealer_hand, dealer_score, player_hand, player_score)

  # 5. Increment game counter
  last_winner = detect_winner(dealer_score, player_score)
  case last_winner
  when 'Player'
    player_games += 1
  when 'Dealer'
    dealer_games += 1
  end

  # Play until 5 games won by either the player or the dealer
  if player_games == 5 || dealer_games == 5
    prompt "#{last_winner} won the match!"
    prompt "Final Score - Player: #{player_games}, Dealer: #{dealer_games}"
    break
  else
    prompt "Running Score - Player: #{player_games}, Dealer: #{dealer_games}"
    prompt "Press enter to continue."
    answer = gets.chomp
  end
end

# 7. End game
prompt "Thank you for playing!"
