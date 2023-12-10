test_file_path = File.expand_path("./../test_input.txt", __FILE__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")


file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")


def parse(line)
  line.split.map(&:to_i)
end

def get_sequences(data)
  sequences = []
  data.each do |line| 
    sequences << parse(line)
  end
  return sequences
end

def get_next(seq)
  if seq.all?(0)
    return 0
  else
    return seq.last + get_next(seq.each_cons(2).map{ _2 - _1})
  end
end

def get_prev(seq)
  if seq.all?(0)
    return 0
  else
    return seq.first - get_prev(seq.each_cons(2).map{ _2 - _1})
  end
end

def part1_solution(data)
  sequences = get_sequences(data)
  return sequences.reduce(0) {|acc, seq| acc + get_next(seq)}
end

def part2_solution(data)
  sequences = get_sequences(data)
  return sequences.reduce(0) {|acc, seq| acc + get_prev(seq)}
end

puts part1_solution(test_file_data)

puts part1_solution(file_data)

puts part2_solution(test_file_data)

puts part2_solution(file_data)
