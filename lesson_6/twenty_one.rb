# RB101
# lesson_6
# twenty_one_v2.rb

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

def deal_hand!(deck)
  rand_cards = deck.sample(4)
  remain_cards = INITIAL_DECK.difference(rand_cards)
  dealer_hand = [rand_cards[0], rand_cards[1]]
  player_hand = [rand_cards[2], rand_cards[3]]
  return dealer_hand, player_hand, remain_cards
end

def display_hand(hand, delim = ', ')
  display_hand = hand.map { |card| translate_card(card) }
  display_hand.join(delim)
end

def translate_card(card)
  translated_card = card.reverse
  translated_card.map! do |elem|
    if CARD_TRANSLATIONS.include?(elem)
      CARD_TRANSLATIONS[elem]
    else
      elem
    end
  end
  translated_card.insert(1, 'of').join(' ')
end

def calculate_total(hand)
  num_aces = hand.select { |card| card[1] == 'A' }.length
  sum = 0
  hand.each { |card| sum += CARD_VALUES[card[1]] }
  while sum > 21 && num_aces > 0
    sum -= 10
    num_aces -= 1
  end
  sum
end

def add_card!(hand, current_deck)
  new_card = current_deck.sample
  hand << new_card
  remain_cards = current_deck.difference(new_card)
  return hand, remain_cards
end

def busted?(player_hand)
  calculate_total(player_hand) > 21
end

def dealer_final_hand!(dealer_hand, current_deck)
  while calculate_total(dealer_hand) < 17
    dealer_hand, current_deck = add_card!(dealer_hand, current_deck)
  end
  dealer_hand
end

def detect_result(dealer_hand, player_hand)
  player_score = calculate_total(player_hand)
  dealer_score = calculate_total(dealer_hand)

  if player_score > 21
    :player_busted
  elsif dealer_score > 21
    :dealer_busted
  elsif dealer_score < player_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def detect_winner(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    'Dealer'
  when :dealer
    'Dealer'
  when :dealer_busted
    'Player'
  when :player
    'Player'
  when :tie
    'Tie'
  end
end

player_games = 0
dealer_games = 0

loop do
  # 2. Deal cards to player and dealer
  dealer_hand, player_hand, current_deck = deal_hand!(INITIAL_DECK)
  prompt "The dealer's card is the #{display_hand([dealer_hand.first])}."
  prompt "Your hand: #{display_hand(player_hand)}"
  prompt "Your score: #{calculate_total(player_hand)}"

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
      player_hand, current_deck = add_card!(player_hand, current_deck)
      break if busted?(player_hand)
      prompt "Your hand: #{display_hand(player_hand)}"
      prompt "Your score: #{calculate_total(player_hand)}"
    else
      prompt "Sorry, must enter 'hit' or 'stay'."
    end
  end

  # 4. Determine winner and display results
  # if player busted
  if busted?(player_hand)
    prompt "Your hand: #{display_hand(player_hand)}.  You busted."
  # player didn't bust
  # determine dealer's hand and score
  else
    prompt "Your score: #{calculate_total(player_hand)}."
    dealer_hand = dealer_final_hand!(dealer_hand, current_deck)
    prompt "The dealer's final hand was #{display_hand(dealer_hand)}."
    # if dealer busted
    if busted?(dealer_hand)
      prompt "Dealer busted so you won! Congrats!"
    # otherwise calculate winner
    else
      case detect_winner(dealer_hand, player_hand)
      when 'Dealer'
        prompt "Sorry, you lost, dealer had #{calculate_total(dealer_hand)}."
      when 'Player'
        prompt "You won!  Dealer had #{calculate_total(dealer_hand)}."
      when 'Tie'
        prompt "It was a tie!"
      end
    end
  end

  # 5. Increment game counter
  case detect_winner(dealer_hand, player_hand)
  when 'Player'
    player_games += 1
  when 'Dealer'
    dealer_games += 1
  end
  prompt "Overall Score - Player: #{player_games}, Dealer: #{dealer_games}"

  # 6. Ask user to play again
  prompt "Play again? (y or n)"
  answer = gets.chomp
  # 5.1. If yes, loop back through to play another game.
  break unless answer.downcase.start_with?('y')
end

# 7. End game
prompt "Thank you for playing!"
