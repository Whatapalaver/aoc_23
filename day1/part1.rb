file_path = File.expand_path("./../input.txt", __FILE__)
input     = File.read(file_path)
file_data = input.split("\n")

def solution(lines)
  result = 0
  lines.each do |line|
    digit_line = line.gsub(/\D/, '')
    concat_value = digit_line[0] + digit_line[-1]
    result += concat_value.to_i
  end
  result
end

puts solution(file_data)