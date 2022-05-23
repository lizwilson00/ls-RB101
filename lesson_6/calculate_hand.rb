CARD_TRANSLATIONS = { 'A' => 'Ace', 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King',
  'S' => 'Spades', 'H' => 'Hearts', 'D' => 'Diamonds',
  'C' => 'Clubs'}

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

def display_hand(hand, delim = ', ', word_sep = 'and')
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

card = ['H', 'J']
p translate_card(card)

hand = [['H', 'J'], ['H', 'A'], ['H', '5']]
p display_hand(hand)
p hand
# , ['C','A']]
# , ['H', '5'], ['C','A']]