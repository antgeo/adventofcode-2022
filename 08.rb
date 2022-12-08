input = File.open("inputs/day8.txt")
rows = []

input.each do |line|
    next if line == "\n"
    rows << line.strip.split('')
end

visible = 0
rows.each_with_index do |row, row_idx|
    if (rows.first == row) | (rows.last == row)
        visible += rows.count
        next
    end
    row.each_with_index do |tree, idx|
        if (row.first.equal? tree) | (row.last.equal? tree)
            #puts tree
            visible += 1
            next
        end
        # look right
        if row[idx+1..-1].none?{|i| i >= tree}
            visible += 1
            next            
        end 
        # look left
        if row[0..idx-1].none?{|i| i >= tree}
            visible += 1
            next            
        end
        # look down 
        if rows[row_idx+1..-1].none?{|i| i[idx] >= tree }
            visible += 1
            next
        end
        # look up             
        if rows[0..row_idx-1].none?{|i| i[idx] >= tree }
            visible += 1
            next
        end            
    end
end
puts "Part 1: #{visible}"

scores = []
rows.each_with_index do |row, row_idx|
    row.each_with_index do |tree, idx|
        score = {}
        # look right
        row[idx+1..-1].each do |i|
            score[:right] ||= 0
            score[:right] += 1
            break if i >= tree
        end
        # look left
        if idx != 0 
            row[0..idx-1].reverse.each do |i|
                score[:left] ||= 0
                score[:left] += 1
                break if i >= tree
            end
        end    
        # look down
        rows[row_idx+1..-1].each do |i|
            score[:down] ||= 0
            score[:down] += 1
            break if i[idx] >= tree
        end
        # look up
        if row_idx != 0
            rows[0..row_idx-1].reverse.each do |i|
                score[:up] ||= 0
                score[:up] += 1
                break if i[idx] >= tree
            end
        end
        scores << score.map{|_,a| a}.reduce(:*)
    end    
end
puts "Part 2: #{scores.sort.last}"