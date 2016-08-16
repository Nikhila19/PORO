# Isomorphic algorithm
# "egg", "add" return true
# "foo", "bar" return false (a letter may not map to mre than one other letter)
# "bar", "foo" return false (no 2 letter may map to the same letter)
# "paper", "title", return true
# "dad", "dod" return true (letter may map to itself)
# "abca" and "zbxz" return true

def isomorphic(s, d)
  return false if s.length != d.length
  hashS, hashD = {}, {}
  arrS, arrD = s.chars, d.chars

  for i in 0..s.length
    sChar, dChar = arrS[i], arrD[i]
    sCharMap, dCharMap = hashS[sChar], hashD[dChar]

    if !sCharMap && !dCharMap
      hashS[sChar] = dChar
      hashD[dChar] = sChar
    else
      return false if sCharMap != arrD[i] || dCharMap != arrS[i]
    end
  end

  return true
end

puts "egg, add = #{isomorphic('egg', 'add')}"
puts "foo, bar = #{isomorphic('foo', 'bar')}"
puts "bar, foo = #{isomorphic('bar', 'foo')}"
puts "'paper', 'title' = #{isomorphic('paper', 'title')}"
puts "abca, zbxz = #{isomorphic('abca', 'zbxz')}"
puts "dad, dod = #{isomorphic('dad','dod')}"
puts "abcd, qweet = #{isomorphic('abcd', 'qweet')}"
