def winning_options(time, distance)
  winning_options = []
  (1..time-1).to_a.each do |hold_time|
    attempt_distance = hold_time * (time - hold_time)
    if attempt_distance > distance
      winning_options << attempt_distance 
    end
  end
  return winning_options.count
end

def solution(race_time, distance)
  winning_options(race_time, distance)
end

puts "Part 2 Test result"
# puts solution(71530,940200) == 71503

puts "Part 2 Main result"
puts solution(62649190,553101014731074)
