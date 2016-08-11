# Remove any 2 consecutive characters that are the same
# baab ==> bb ==> Empty String

def reduce_str(str)
    len = str.length
    if len <= 0
        return "Empty String" 
         
    end
    prevIndex, nextIndex = 0, 1
    repeatsArr, condensedArray = [], []
    
    while (prevIndex + 1 < len)
        if nextIndex < len && str[prevIndex] == str[nextIndex]
            repeatsArr << prevIndex 
            prevIndex = prevIndex + 2
            nextIndex = nextIndex + 2
        else
            prevIndex = prevIndex + 1
            nextIndex = nextIndex + 1
        end
    end
    # print repeatsArr
    unless repeatsArr.empty?
        prev = 0
        repeatsArr.each do |idx|
            condensedArray << str.slice(prev..idx-1) if idx > 0
            prev = idx + 2
        end
        condensedArray << str.slice(prev..len-1) if prev < len
        # print condensedArray
        unless condensedArray.length == 0
            reduce_str(condensedArray.join(""))  
        else
            return "Empty String"
        end

    else
        return str
    end
end


inp = $stdin.read
puts reduce_str(inp)


puts "Input abcddefghh =====> Result = #{reduce_str('abcddefghh')}"
puts "Input aabbccddeeffgghh =====> Result = #{reduce_str('aabbccddeeffgghh')}"
puts "Input aaabbbcccdddeeefffggghhh =====> Result = #{reduce_str('aaabbbcccdddeeefffggghhh')}"
puts "Input abcdefgh =====> Result = #{reduce_str('abcdefgh')}"
puts "Input aaabccddd =====> Result = #{reduce_str('aaabccddd')}"
puts "Input baab =====> Result = #{reduce_str('baab')}"
puts "Input aa =====> Result = #{reduce_str('aa')}"
puts "Input '' =====> Result = #{reduce_str('')}"
puts "Input 'aaabccddd' =====> Result = #{reduce_str('aaabccddd')}"
