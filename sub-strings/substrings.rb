def substrings(word, dictionary)
  word = word.downcase
  dictionary.reduce(Hash.new(0)) do |hash, substring|
    word.scan(substring) { hash[substring] += 1 }
    hash
  end
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)  