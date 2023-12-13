test_file_path = File.expand_path('test_input.txt', __dir__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path('input.txt', __dir__)
input     = File.read(file_path)
file_data = input.split("\n")

class Hand
  attr_reader :bid, :cards, :joker_rules

  CARD_SCORES = %w[2 3 4 5 6 7 8 9 T J Q K A].each_with_index.to_h.freeze
  CARD_SCORES_WITH_JOKER = %w[J 2 3 4 5 6 7 8 9 T Q K A].each_with_index.to_h.freeze

  def initialize(bid, cards, joker_rules= false)
    @bid = bid
    @cards = cards.chars
    @joker_rules = joker_rules
  end

  def joker_count
    cards.count("J")
  end

  def hand_shape
    # -> [2,2,1]
    if joker_rules and joker_count.between?(1,4)
      exclude_joker_tally = cards.tally.except("J").values.sort.reverse
      exclude_joker_tally[0] = exclude_joker_tally[0] + joker_count
      return exclude_joker_tally
    end
    cards.tally.values.sort.reverse
  end

  def card_score(card)
    # -> 0-12
    if joker_rules
      CARD_SCORES_WITH_JOKER[card]
    else
      CARD_SCORES[card]
    end
  end

  def cards_score
    cards.map { |card| card_score(card) }
  end
end

def sort_hands(hands)
  hands.sort_by do |hand|
    [hand.hand_shape, hand.cards_score]
  end
end

def parse_to_hands(lines, joker_rules=false)
  hands = []
  lines.each do |line|
    cards, bid_string = line.split(' ')
    hands << Hand.new(bid_string.to_i, cards, joker_rules)
  end
  hands
end

def solution(data, joker_rules=false)
  hands = parse_to_hands(data, joker_rules)
  ordered_hands = sort_hands(hands)
  ordered_hands.each_with_index.reduce(0) do |memo, (hand, index)|
    rank = index + 1
    memo + (hand.bid * rank)
  end
end

puts solution(test_file_data)
puts solution(file_data)

puts solution(test_file_data, joker_rules=true)
puts solution(file_data, joker_rules=true)
