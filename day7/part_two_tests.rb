require 'minitest/autorun'
require_relative './solution'

class PartTwoTest < Minitest::Test

  def test_part_two_solution_with_test_data
    assert_equal 5905, solution(['32T3K 765', 'T55J5 684', 'KK677 28', 'KTJJT 220', 'QQQJA 483'], joker_rules=true)
  end

  def test_five_hand_shape_one_joker
    hand = Hand.new(0, 'AAAAJ', joker_rules=true)
    assert_equal [5], hand.hand_shape
  end

  def test_three_hand_shape_one_joker
    hand = Hand.new(0, 'AAKJ2', joker_rules=true)
    assert_equal [3, 1, 1], hand.hand_shape
  end

  def test_three_hand_shape_two_joker
    hand = Hand.new(0, 'AK9JJ', joker_rules=true)
    assert_equal [3, 1, 1], hand.hand_shape
  end

  def test_five_hand_shape_all_jokers
    hand = Hand.new(0, 'JJJJJ', joker_rules=true)
    assert_equal [5], hand.hand_shape
  end

end