# RB101
# lesson_6
# detect_winner.rb 

CARD_VALUES = { 'A' => 11, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, 
  '7'=> 7, '8'=> 8, '9'=> 9, '10'=> 10, 'J'=> 10, 'Q'=> 10, 'K'=> 10 }

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

def detect_winner(dealer_hand, player_hand)
  # determine bust scenario
  dealer_bust = true if calculate_total(dealer_hand) > 21
  player_bust = true if calculate_total(player_hand) > 21
  if dealer_bust || player_bust
    return 'Tie' if (dealer_bust && player_bust)
    return 'Player' if dealer_bust
    return 'Dealer' if player_bust
  else
    case calculate_total(dealer_hand) <=> calculate_total(player_hand)
    when 1
      'Dealer'
    when -1
      'Player'
    when 0
      'Tie'
    end
  end
end

dealer_hand = [['H', 'J'], ['H', 'A'], ['H', '5']]
player_hand = [['C', '2'], ['C', '4'], ['C', 'Q']]

p detect_winner(dealer_hand, player_hand)