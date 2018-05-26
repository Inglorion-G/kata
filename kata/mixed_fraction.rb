def mixed_fraction(s)
  numerator, denominator = s.split('/').map(&:to_i)

  raise ZeroDivisionError if denominator.to_i.zero?
  
  if evenly_divides?(numerator, denominator)
    (numerator / denominator).to_s
  else
    reduce_fraction(numerator, denominator)
  end
end

def reduce_fraction(numerator, denominator)
  sign = (numerator * denominator).negative? ? -1 : 1
  whole = numerator.abs / denominator.abs
  remainder = (numerator - (whole * denominator)).abs
  
  top = remainder.abs
  bottom = denominator.abs
  
  fractional = simplify_fraction(top, bottom)
  
  if evenly_divides?(numerator, denominator) || whole.zero?
    "#{fractional}"
  else
    "#{sign * whole} #{fractional}"
  end
end

def simplify_fraction(numerator, denominator)
  divisor = lcd(numerator, denominator)
  puts "numerator: #{numerator}, denominator: #{denominator} divisor: #{divisor}"
  
  numerator /= divisor
  denominator /= divisor
  
  return "#{numerator}/#{denominator}"
end

def lcd(numerator, denominator)
  if denominator > 0
    2.upto(denominator).each do |factor|
      return factor if denominator % factor == 0 && numerator % factor == 0
    end
  else
    -2.downto(denominator).each do |factor|
      return factor if denominator % factor == 0 && numerator % factor == 0
    end
  end
  
  1
end

def evenly_divides?(top, bottom)
  top % bottom == 0
end
