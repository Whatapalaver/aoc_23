mkdir -p ./day$1
touch ./day$1/test_input.txt
touch ./day$1/input.txt
cp ./scripts/setup_util.rb ./day$1/part1.rb
cp ./scripts/setup_util.rb ./day$1/part2.rb
touch ./day$1/README.md
echo "# DAY $1" >> ./day$1/README.md
