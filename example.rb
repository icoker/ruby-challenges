sequence = [1, 2, 'b']

number_sequence = sequence.map(&:to_i).sort
puts number_sequence