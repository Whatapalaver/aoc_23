test_file_path = File.expand_path("./../test_input.txt", __FILE__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")

# line_1 = "Game 1: 1 red, 10 blue, 5 green; 11 blue, 6 green; 6 green; 1 green, 1 red, 12 blue; 3 blue; 3 blue, 4 green, 1 red"

# => [id, r, g, b]

def parse(line)
  id_regex = /^Game (?<id>\d+)/
  red_regex = /(?<reds>\d+) red/
  green_regex = /(?<greens>\d+) green/
  blue_regex = /(?<blues>\d+) blue/

  return line.match(id_regex)[1], line.scan(red_regex).flatten.map(&:to_i).max, line.scan(green_regex).flatten.map(&:to_i).max, line.scan(blue_regex).flatten.map(&:to_i).max
end

def get_val(str)
  if str == nil
    return 0
  else
    return str.to_i
  end
end

def solution(input)
  count = 0
  input.each do |line|
    parsed_line = parse(line)
    count += parsed_line[1]*parsed_line[2]*parsed_line[3]
  end
  return count
end

p solution(test_file_data)
p solution(file_data)