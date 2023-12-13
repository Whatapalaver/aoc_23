require 'debug'

test_file_path = File.expand_path('input.txt', __dir__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path('input.txt', __dir__)
input     = File.read(file_path)
file_data = input.split("\n")

class Hand
  attr_reader :bid, :cards

  CARD_SCORES = %w[2 3 4 5 6 7 8 9 T J Q K A].each_with_index.to_h.freeze

  def initialize(bid, cards)
    @bid = bid
    @cards = cards.chars
  end

  def hand_shape
    # -> [2,2,1]
    cards.tally.values.sort.reverse
  end

  def hand_type
    # No longer using this but might go back to it as it's more expressive of the domain
    # Would need to then generate a hand_type score for sorting
    case hand_shape
    when [5]
      "five"
    when [4,1]
      "four"
    when [3,2]
      "full"
    when [3,1,1]
      "three"
    when [2,2,1]
      "twopair"
    when [2,1,1,1]
      "onepair"
    else
      "high"
    end
  end

  def card_score(card)
    # -> 0-12
    CARD_SCORES[card]
  end

  def cards_score
    cards.map { |card| card_score(card) }
  end
end

def sort_hands(hands)
  hands.sort_by do |hand|
    # debugger
    [hand.hand_shape, hand.cards_score]
  end
end

def parse_to_hands(lines)
  hands = []
  lines.each do |line|
    cards, bid_string = line.split(' ')
    hands << Hand.new(bid_string.to_i, cards)
  end
  hands
end

def solution(data)
  hands = parse_to_hands(data)
  ordered_hands = sort_hands(hands)
  ordered_hands.each_with_index.reduce(0) do |memo, (hand, index)|
    rank = index + 1
    memo + (hand.bid * rank)
  end
end

puts solution(test_file_data)
puts solution(file_data)
