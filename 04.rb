#!ruby

input = File.open("inputs/day4.txt")
count = 0
part2 = 0
input.each do |line|
    s1, s2 = line.strip.split(',')
    s1_range = (s1.split('-')[0]..s1.split('-')[1])
    s2_range = (s2.split('-')[0]..s2.split('-')[1])
    part2 = part2 + 1 if (s1_range.any?{|x| s2_range.include? x}) | (s2_range.any?{|x| s1_range.include? x})
    count = count + 1 if (s1_range.all?{|x| s2_range.include? x}) | (s2_range.all?{|x| s1_range.include? x})
end
puts "Part 1: #{count}"
puts "Part 2: #{part2}"