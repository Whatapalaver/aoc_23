test_file_path = File.expand_path('test_input.txt', __dir__)
test_input     = File.read(test_file_path)
test_file_data = test_input.split("\n")

file_path = File.expand_path('input.txt', __dir__)
input     = File.read(file_path)
file_data = input.split("\n")

def solution(data)
  pass
end

puts solution(test_file_data)
# puts solution(file_data)
