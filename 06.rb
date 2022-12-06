#!ruby

input = File.open("inputs/day6.txt")

chars = input.first.strip.split('')
parts = [4,14]
parts.each_with_index do |part, idx|
    for i in 0..chars.count
        check = chars[i..i+part-1]
        if (check.uniq.count == part)
            puts "Part #{idx+1}: #{i+part}"
            break
        end
    end
end