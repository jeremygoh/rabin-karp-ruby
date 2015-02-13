
#basic implementation of Rabin-Karp

$prime = 977

def search(str, pattern)
  return nil if str.length < pattern.length

  pattern_hash = hash(pattern)

  i = 0
  str_hash = hash(str[0...pattern.length])

  while true

    if str_hash == pattern_hash && pattern == str[i...i+pattern.size]
      return i
    end

    break if i + pattern.length >= str.length

    #remove a char
    str_hash = (str_hash - (str[i].ord * 256**(pattern.size - 1))) % $prime

    #add a char
    str_hash = (str_hash * 256 + str[i + pattern.length].ord) % $prime

    i += 1
  end
  nil
end


def hash(str)
  output = 0

  (0...str.length).each do |x|
    output = output * 256 + str[x].ord
  end

  output % $prime
end

puts search("hello there I am sam", "am s")


