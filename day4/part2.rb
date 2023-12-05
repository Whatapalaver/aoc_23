test_file_path = File.expand_path("./../test_input.txt", __FILE__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")

def parse(line)
  left, right = line.split("|")
  id = left.match(/Card\s+(\d+)/)[1].to_i
  winning_numbers = left.split(":")[1].split().map(&:to_i)
  entries = right.split().map(&:to_i)
  matches = winning_numbers.intersection(entries).length
  return id, matches
end

def solution(lines)
  cards = {}
  lines.each do |line|
    id, wins = parse(line)
    cards[id] = {"count" => 1, "wins" => wins}
  end
  puts cards
  # generate extra cards and update hash_count
  cards.keys.each do |key|
    next_key = key + 1
    end_key = key + cards[key]["wins"]
    new_card_ids = [*next_key..end_key]
    card_count = cards[key]["count"]
    card_count.times do
      new_card_ids.each do |extra_key| 
        cards[extra_key]["count"] += 1
      end
    end
  end
  # count the value of all hash keys

  return cards.map {|k,v| v["count"]}.sum
end

puts solution(test_file_data)
puts solution(file_data)
