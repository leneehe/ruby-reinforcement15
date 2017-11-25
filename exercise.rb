ballots = [{1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba'},
           {1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger'},
           {1 => 'Bella', 2 => 'Boots', 3 => 'Smudge'},
           {1 =>'Boots', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Lucky', 2 => 'Felix', 3 => 'Bella'},
           {1 => 'Smudge', 2 => 'Simba', 3 => 'Felix'}]

# Get all the candidate names, put in an array
candidates = []
ballots.each do |vote|
  candidates << vote.values
end
candidates.flatten!.uniq!

total_votes = Hash.new(0)

ballots.each do |vote|
  candidates.each do |c|
    if vote.key(c) == 1
      total_votes[c] += 3
    elsif vote.key(c) == 2
      total_votes[c] += 2
    elsif vote.key(c) == 3
      total_votes[c] += 1
    end
  end
end

winner = total_votes.key(total_votes.values.max)
puts "The winner is #{winner}!!! Congrats #{winner}!"
