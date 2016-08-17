# Finds the longest subsequence of the given pattern in the text
# Create a frequency hash of the characters in the pattern
# as and when we read a character in the text, increment the hasFound hash key
# Simultaneously, increment a 'counter' when the hasFound <= needToFind
# When the counter == pattern length, we know we have all the characters we 'need'
# Now start reducing the window length to see when we reach the smallest window 
# with all the characters we need
# Very well explained here: http://articles.leetcode.com/finding-minimum-window-in-s-which/
def find_smallest_subsequence(text, pattern)
  puts "text= #{text}; pattern= #{pattern}"
  beginPtr, minBeginPtr, endPtr, minEndPtr = 0, 0, text.length-1, -1
  hasFound = Hash.new(0)
  needToFind = Hash.new(0)
  counter, windowLen, minWindowLen = 0,0,-1

  pattern.chars.each { |c| needToFind[c] += 1 }

  text.chars.each_with_index do |c, idx|    
    endPtr = idx
    # puts "looking at text char #{c}; beginPtr= #{beginPtr}; endPtr=#{endPtr}"

    if needToFind.has_key?(c)
      hasFound[c] += 1
      if hasFound[c] <= needToFind[c]
        counter += 1 
      end

      ch = text.chars[beginPtr] 
      if counter == pattern.length 

        # puts "hasFound= #{hasFound.inspect}"
        # puts "ch= #{ch}; beginPtr= #{beginPtr}; endPtr=#{endPtr}"

        while hasFound[ch] > needToFind[ch] || needToFind[ch] == 0
          # puts "hasFound[#{ch}] = #{hasFound[ch]}; needToFind[#{ch}] = #{needToFind[ch]}"

          unless needToFind[ch] == 0
            hasFound[ch] -= 1 if hasFound.has_key?(ch)
            # puts "changing ptrs; beginPtr= #{beginPtr}; endPtr=#{endPtr}; hasFound= #{hasFound.inspect}"
          end
          beginPtr = beginPtr + 1 
          ch = text.chars[beginPtr] 
        end
        windowLen = endPtr - beginPtr + 1
        # print "Found the current minWindow ==> beginPtr= #{beginPtr}; endPtr=#{endPtr}; windowLen= #{windowLen}; minWindowLen= #{minWindowLen}"
        if minWindowLen == -1 || windowLen < minWindowLen
          minWindowLen = windowLen 
          minBeginPtr = beginPtr
          minEndPtr = endPtr
        end
        # print " was changed to minWindowLen= #{minWindowLen}"
        # puts "\n\n"
      end

    end
  end
  return ['none', 'none', 'none'] if minEndPtr == -1
  return [minBeginPtr, minEndPtr, text[minBeginPtr..minEndPtr]]
end

ret = find_smallest_subsequence('cabeca', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('cfabeca', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('cabefgecdaecf', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts ""

ret = find_smallest_subsequence('cabwefgewcwaefcf', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts ""

ret = find_smallest_subsequence('abcabdebac', 'cda')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts ""

ret = find_smallest_subsequence('abcabdebac', 'cea')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('acbdbaab', 'aabd')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('caaec', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('caae', 'cae')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('a', 'a')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('a', 'b')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('aa', 'a')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"

ret = find_smallest_subsequence('aab', 'aab')
print "#{ret[0]} #{ret[1]} #{ret[2]}"
puts "\n\n"



