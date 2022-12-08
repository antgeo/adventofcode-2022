#!ruby 

input = File.open("inputs/day5.txt")

stack = {}
stack_part2 = {}
input.each do |line|
    m = line.split( /(.{3}) (.{3}) (.{3}) (.{3}) (.{3}) (.{3}) (.{3}) (.{3}) (.{3})/ )
    if m.count == 11
        for i in 1..m.count-2
            stack[i] ||= []            
            stack[i].insert(0, m[i])
        end
    end
    if line == "\n"
        stack.each_with_index do |_,i|
            stack[i+1] = stack[i+1].drop(1)
            stack[i+1] = stack[i+1].map{|a| a  == '   ' ? nil : a}.compact
            stack[i+1] = stack[i+1].map{|a| $1 if a =~ /\[(.)\]/}
        end
        stack_part2 = stack.clone
    end    
    if line =~ /move (\d*) from (\d) to (\d)/
        count = $1.to_i
        from = $2.to_i
        to = $3.to_i
        stack[to] = stack[to] + stack[from].last(count).reverse
        stack[from] = stack[from].first(stack[from].count - count)
        stack_part2[to] = stack_part2[to] + stack_part2[from].last(count)
        stack_part2[from] = stack_part2[from].first(stack_part2[from].count - count)
    end
end

puts "Part1: #{stack.map{|a,_| stack[a].last}.join}"
puts "Part2: #{stack_part2.map{|a,_| stack_part2[a].last}.join}"
