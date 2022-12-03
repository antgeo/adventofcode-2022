#!ruby

input = File.open("inputs/day1.txt")

counter = 0
elves = []
input.each do |line|
    if line == "\n"
        elves << counter
        counter = 0
    else
        counter = counter + line.to_i
    end
end

elves = elves.sort
puts "Part 1: #{elves.last}"
puts "Part 2: #{elves.last(3).reduce(:+)}"