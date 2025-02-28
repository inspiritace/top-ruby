# Implement a Caesar cipher that takes in a string and the shift factor and then outputs the modified string using a right shift
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
# You will need to remember how to convert a string into a number.
# Don't forget to wrap from z to a.
# Don't forget to keep the same case.

def caesar_cipher(string, shift)
  string.chars.map do |char|
    if char.match?(/[a-z]/)
      ((char.ord - 97 + shift) % 26 + 97).chr
    elsif char.match?(/[A-Z]/)
      ((char.ord - 65 + shift) % 26 + 65).chr
    else
      char
    end
  end.join
end

puts caesar_cipher("What a string!", 5)