# https://www.codewars.com/kata/556b85b433fb5e899200003f
# convert fractions to most simplified form

def mixed_fraction(s)
  numerator, denominator = s.split('/').map(&:to_i)

  raise ZeroDivisionError if denominator.to_i.zero?
  
  if evenly_divides?(numerator, denominator)
    (numerator / denominator).to_s
  else
    simplify_fraction(numerator, denominator)
  end
end

def simplify_fraction(numerator, denominator)
  sign = (numerator * denominator).negative? ? -1 : 1
  top = numerator.abs
  bottom = denominator.abs

  whole_part = top / bottom
  remainder = top - (whole_part * bottom)

  largest_common_denominator = lcd(remainder, bottom)

  remainder /= largest_common_denominator
  bottom /= largest_common_denominator

  if evenly_divides?(numerator, denominator) || whole_part.zero?
    "#{remainder * sign}/#{bottom}"
  else
    "#{sign * whole_part} #{remainder}/#{bottom}"
  end
end

def lcd(numerator, denominator)
  denominator.downto(2).each do |factor|
    return factor if denominator % factor == 0 && numerator % factor == 0
  end

  1
end

def evenly_divides?(top, bottom)
  top % bottom == 0
end
