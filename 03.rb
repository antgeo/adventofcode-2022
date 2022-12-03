#!ruby

Points = ("a".."z").to_a + ("A".."Z").to_a

input = File.open("inputs/day3.txt")
matches = []
badge_group = []
badge_vals = []

input.each do |rutsack|
    mid_index = rutsack.split('').count / 2
    badge_group << rutsack.strip.split('')
    if badge_group.count == 3
        badge_vals << badge_group[0].select{|i| (badge_group[1].include? i) & (badge_group[2].include? i)  }.uniq.first
        badge_group = []
    end
    lhc = rutsack.split('')[0..mid_index-1] 
    rhc = rutsack.split('')[mid_index..-2]
    matches = matches + lhc.map{ |i| i if rhc.include? i}.uniq.compact
end

puts "Part1: #{matches.map{|i| Points.index(i) + 1}.reduce(:+)}"
puts "Part2: #{badge_vals.map{|i| Points.index(i) + 1}.reduce(:+)}"