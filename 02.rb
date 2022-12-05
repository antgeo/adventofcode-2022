#!ruby

Player1  = {'A' => 1, 'B' => 2, 'C' => 3}
Player2  = {'X' => 1, 'Y' => 2, 'Z' => 3}

ToLose = {1 => 3, 2 => 1, 3 => 2}
ToWin = {1  => 2, 2 => 3, 3 => 1}

def score_calc (player_hand, winning_hand)
    if player_hand == winning_hand
        return player_hand + 6
    else
        return player_hand    
    end
end


input = File.open("inputs/day2.txt")
score = 0
sneaky_elf = 0
input.each do |line|

    hands = line.split
    points = [Player1[hands.first], Player2[hands.last]]

    case points.sort
    when [1,3]; score = score + score_calc(points.last , 1)
    when [1,2]; score = score + score_calc(points.last , 2)
    when [2,3]; score = score + score_calc(points.last , 3)
    else; score = score + points.last + 3 if points.uniq.count == 1
    end

    case hands.last
    when 'X'; sneaky_elf = sneaky_elf + ToLose[points.first]
    when 'Y'; sneaky_elf = sneaky_elf + points.first + 3
    when 'Z'; sneaky_elf = sneaky_elf + ToWin[points.first] + 6
    end

end


puts "Part1 #{score}" 
puts "Part2 #{sneaky_elf}"

