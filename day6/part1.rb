def winning_options(time, distance)
  winning_options = []
  puts ""
  (1..time-1).to_a.each do |hold_time|
    attempt_distance = hold_time * (time - hold_time)
    p "#{attempt_distance} = #{hold_time} * (#{time} - #{hold_time})"
    if attempt_distance > distance
      winning_options << attempt_distance 
    end
  end
  p winning_options
  return winning_options.count
end

def solution(race_times, distance_records)
  win_counts = []
  race_times.each_with_index do |time,idx|
    win_counts << winning_options(time, distance_records[idx])
  end
  p win_counts
  win_counts.reduce(1, :*)
end

puts "Test result"
puts solution([7,15,30],[9,40,200])

puts "Main result"
puts solution([62,64,91,90],[553,1010,1473,1074])

# p winning_options(15,40)
