require 'minitest/autorun'
require_relative './solution'

class PartOneTest < Minitest::Test

  def test_part_one_solution_with_test_data
    assert_equal 6440, solution(['32T3K 765', 'T55J5 684', 'KK677 28', 'KTJJT 220', 'QQQJA 483'])
  end

  def test_five_hand_shape
    hand = Hand.new(0, 'AAAAA')
    assert_equal [5], hand.hand_shape
  end

  def test_two_pairs_hand_shape
    hand = Hand.new(0, 'AAKK2')
    assert_equal [2, 2, 1], hand.hand_shape
  end

  def test_additional_two_pairs_hand_shape
    hand = Hand.new(0, '2KAAK')
    assert_equal [2, 2, 1], hand.hand_shape
  end

  def test_high_hand_shape
    hand = Hand.new(0, '23456')
    assert_equal [1, 1, 1, 1, 1], hand.hand_shape
  end

  def test_hand_score
    hand = Hand.new(0, '2KAAK')
    assert_equal [0, 11, 12, 12, 11], hand.cards_score
  end

  def test_hand_ordering
    ordered_bids = [765, 220, 28, 684, 483]
    input_hands = [
      Hand.new(765, '32T3K'),
      Hand.new(684, 'T55J5'),
      Hand.new(28, 'KK677'),
      Hand.new(220, 'KTJJT'),
      Hand.new(483, 'QQQJA')
    ]
    sorted_hands = sort_hands(input_hands)
    assert_equal ordered_bids, sorted_hands.map(&:bid)
  end
end
