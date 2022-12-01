#!ruby

input = File.open("inputs/day1.txt")

counter = 0
elfs = []
input.each do |line|
    if line == "\n"
        elfs << counter
        counter = 0
    else
        counter = counter + line.to_i
    end
end

elfs = elfs.sort
puts "Part 1: #{elfs.last}"
puts "Part 2: #{elfs.last(3).reduce(:+)}"