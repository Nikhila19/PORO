# This program returns a true oif the edit distance betwen the given 2 strings is 0 or 1
# A replace, insert, or delete is counted as an edit. Edit distance is 0 when the strings are the same
# When the len of given two strings is the same, they may end being the same two strings or qualify for oneaway replace
# Two strings qualify for insert or delete only if their edit distance is 1

class OneAway

  def self.find_one_away(str1, str2)
    lstr, sstr = find_longer_shorter_string(str1,str2)
    return findIfOneAway(lstr, sstr, "ins_del") if length_difference(str1, str2) == 1
    return findIfOneAway(lstr, sstr, "replace") if length_difference(str1, str2) == 0
    return false # if given 2 strings are more than one char diff in length, just return false
  end

  def self.findIfOneAway(lstr, sstr, mode)
    len1, len2, j = lstr.length, sstr.length, 0
    lstrChars, sstrChars = lstr.chars, sstr.chars
    h, oneaway = { "ins_del": false, "replace": false }, true

    # compares char by char of the first and second str
    # when it finds a mismatch, it marks the h[mode] as true,
    # increments the ptr of only the longer string and does the comparison again
    # If this comparison also fails, then it returns false 
    for i in (0..len1-1)
      char1 = lstrChars[i]
      char2 = sstrChars[j]
      return oneaway if j == len2
      return false if char1 != char2 && h[mode]
      h[mode] = true if char1 != char2
      j += 1 if char1 == char2 && mode == "ins_del"
    end

    return oneaway
  end

  def self.find_longer_shorter_string(str1, str2)
    str1.chars.length >= str2.chars.length ? [str1, str2] : [str2, str1]
  end

  def self.length_difference(str1, str2)
    diff = str1.chars.length - str2.chars.length
    positive_diff = diff < 0 ? -1*diff : diff
    return positive_diff
  end

end

puts "result of ('pale','pal') is #{OneAway.find_one_away('pale', 'pal')}"
puts "result of ('pal','pale') is #{OneAway.find_one_away('pal', 'pale')}"
puts "result of ('pale','phn') is #{OneAway.find_one_away('pale', 'phn')}"
puts "result of ('pale','pain') is #{OneAway.find_one_away('pale', 'pain')}"
puts "result of ('pale','palin') is #{OneAway.find_one_away('pale', 'palin')}"
puts "result of ('palin','pale'), is #{OneAway.find_one_away('palin', 'pale')}"
puts "result of ('aaaa','aaa'), is #{OneAway.find_one_away('aaaa', 'aaa')}"
puts "result of ('aaa','aaaa'), is #{OneAway.find_one_away('aaa', 'aaaa')}"

puts "result of ('aaaa','aabaa'), is #{OneAway.find_one_away('aaaa', 'aabaa')}"
puts "result of ('aaaaa','aabaa'), is #{OneAway.find_one_away('aaaaa', 'aabaa')}"
puts "result of ('aaaaaa','aabaa'), is #{OneAway.find_one_away('aaaaaa', 'aabaa')}"
puts "result of ('aabaaa','aabaa'), is #{OneAway.find_one_away('aabaaa', 'aabaa')}"
puts "result of ('aaaaa','aabaab'), is #{OneAway.find_one_away('aaaaa', 'aabaab')}"
puts "result of ('a',''), is #{OneAway.find_one_away('a', '')}"
puts "result of ('aaa','aaa'), is #{OneAway.find_one_away('aaa', 'aaa')}"





  # def self.findIfInsertDelete(lstr,sstr)
  #   len1 = lstr.length
  #   len2 = sstr.length
  #   lstrChars = lstr.chars
  #   sstrChars = sstr.chars
  #   h = { "ins_del": false, "replace": false }
  #   oneaway = true
  #   j = 0

  #   for i in (0..len1-1)
  #     char1 = lstrChars[i]
  #     char2 = sstrChars[j]
  #     return oneaway if j == len2 || !oneaway
  #     return false if char1 != char2 && h["ins_del"]
  #     h["ins_del"] = true if char1 != char2
  #     j += 1 if char1 == char2
  #     # if char1 == char2
  #     #     j += 1 
  #     # else
  #     #   oneaway = false if h["ins_del"] == true
  #     #   h["ins_del"] = true
  #     # end
  #   end

  #   return oneaway
  # end

  # def self.findIfReplace(str1, str2) 
  #   len1 = lstr.length
  #   len2 = sstr.length
  #   lstrChars = lstr.chars
  #   sstrChars = sstr.chars
  #   h = { "ins_del": false, "replace": false }
  #   oneaway = true

  #   for i in (0..len1-1)
  #     return false if lstrChars[i] != sstrChars[i] && h["replace"]
  #     h["replace"] = true if lstrChars[i] != sstrChars[i]
  #   end
  #   return oneaway
  # end


