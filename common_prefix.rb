# Given a list of words, find the longest common prefix
# Example 1 : [“abcd”, “abc”, “abxd”] => “ab”
# Example 2: [“abcd”, “abc”, “abxd”, “bd”] => “”
# Example 3: ["ab”, “aaaabc”, “abc”, “abc”] => “a”


def common_prefix(list=[])
  return "" if list.empty?

  charArray, prefix = [], []

  for j in 0..list.first.length
    c = list.first.chars[j]

    for i in 1..list.length - 1
      charArray[i] = list[i].chars
      return prefix.join if c != charArray[i][j]
    end
    prefix << c

  end

  return prefix.join
end

puts "#{common_prefix(%w(abcd abc abxd))}"
puts "#{common_prefix(%w(abcd abc abxd bd))}"
puts "#{common_prefix(%w(abcd abcd abcd abcd))}"
puts "#{common_prefix(%w(ab aaaabc abc abc))}"