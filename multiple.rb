def multiples(limit, *numbers)
  (1...limit).select do |candidate|
    numbers.any? { |divider| candidate % divider == 0 }
  end.reduce(:+)
end

multiples(1000, 3)
multiples(1000, 3, 5)
