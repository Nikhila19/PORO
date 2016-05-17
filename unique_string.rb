# This method takes a string and returns if any characters repeat(non-unique) or not (unique)
# It uses the ASCII value of a character and hence works only for ASCII characters

def is_unique?(test_str='')
  arr = []
  unique = true
  test_str.chars.each do |t|
    i = t.upcase.sum - 65 # sum returns n-bit checksum of the chars
    arr[i] = (arr[i] || 0) + 1
    if arr[i] > 1
      unique = false
      break
    end
 end
 return unique
end

puts is_unique?('abcd')

