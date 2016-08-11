def reduce_str(str='')
  str_array = str.chars
  new_str = []

  str_array.each do |c|
    if new_str.last == c
      new_str.pop 
    else
      new_str.push(c)
    end
  end
  return new_str.join
end


puts "Input abcddefghh =====> Result = #{reduce_str('abcddefghh')}"
puts "Input aabbccddeeffgghh =====> Result = #{reduce_str('aabbccddeeffgghh')}"
puts "Input aaabbbcccdddeeefffggghhh =====> Result = #{reduce_str('aaabbbcccdddeeefffggghhh')}"
puts "Input abcdefgh =====> Result = #{reduce_str('abcdefgh')}"
puts "Input aaabccddd =====> Result = #{reduce_str('aaabccddd')}"
puts "Input baab =====> Result = #{reduce_str('baab')}"
puts "Input aa =====> Result = #{reduce_str('aa')}"
puts "Input '' =====> Result = #{reduce_str('')}"
puts "Input 'aaabccddd' =====> Result = #{reduce_str('aaabccddd')}"