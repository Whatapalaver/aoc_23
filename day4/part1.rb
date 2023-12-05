test_file_path = File.expand_path("./../test_input.txt", __FILE__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")

def parse(line)
  left, right = line.split("|")
  winning_numbers = left.split(":")[1].split().map(&:to_i)
  your_numbers = right.split().map(&:to_i)
  return winning_numbers, your_numbers
end

def score(wins, entry)
  matches = wins.intersection(entry).length
  if matches < 1
    return 0
  else
    return 2**(matches-1)
  end
  
end

def solution(lines)
  result = 0
  lines.each do |line|
    wins, entries = parse(line)
    puts score(wins, entries)
    result += score(wins, entries)

    # puts wins.to_s + entries.to_s + wins.intersection(entries).length.to_s + " " + score(wins, entries).to_s
    
  end
  return result
end

p solution(test_file_data)
p solution(file_data)