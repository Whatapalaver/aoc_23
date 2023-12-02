file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")

WORD_NUMS = {
  "one": "1",
  "two": "2",
  "three": "3",
  "four": "4",
  "five": "5",
  "six": "6",
  "seven": "7",
  "eight": "8",
  "nine": "9",
}

def incorrect_solution(lines)
  # Problematic due to overlapping number words eg EIGHTWO TWOONE
  result = 0
  lines.each do |line|
    WORD_NUMS.keys.each do |word|
      line.gsub!(word.to_s, WORD_NUMS[word])
    end
    digit_line = line.gsub(/\D/, '')
    concat_value = digit_line[0] + digit_line[-1]
    puts concat_value
    result += concat_value.to_i
  end
  result
end

def find_number_starting(index, string)
  if string[index].match?(/\d/)
    return string[index]
  end
  WORD_NUMS.keys.each do |word|
    if string[index..].start_with?(word.to_s)
      return WORD_NUMS[word]
    end
  end
  return nil
end

def solution(lines)
  result = 0
  lines.each do |line|
    first_number_str = nil
    last_number_str = nil

    # find first number
    for x in 0..line.length - 1
      if find_number_starting(x, line)
        first_number_str = find_number_starting(x, line)
        break
      end
    end
    
    # find last number
    (line.length - 1).downto(0) do |x| 
      if find_number_starting(x, line)
        last_number_str = find_number_starting(x, line).to_s
        break
      end
    end
    result += (first_number_str + last_number_str).to_i
  end
  return result
end

puts solution(file_data)
