# The problem statement is on HackerRank https://www.hackerrank.com/challenges/anagram
# Basically, this solves the question of 'how many characters should 
# i change in given 2 strings to make them anagrams of each other'
# My approach is to use a frequency hash of the given strings and 
# do a hash_difference of those frequency hashes

class String
    def anagram?(str1="")
        self.frequency_hash == str1.frequency_hash
    end
    def half_split
        return [nil,nil] if self.length.odd?
        split_len = self.length/2
        [self.slice(0, split_len), self.slice(split_len, split_len)]
    end
    def frequency_hash
        @hsh ||= self.chars.inject(Hash.new(0)) { |res,s| res[s] = res[s] + 1; res; }
    end
end

class Hash
    def diff(h={})
        res = {}
        self.each do |k,v|
            if self[k] > (h[k] || 0)
              res[k] =  self[k] - (h[k] || 0)
            end       
        end
        res
    end
end


input_strings = []
num_lines = 0
ARGF.each_line do |line|
    if ARGF.lineno == 1
        num_lines = line.chomp.to_i
    else
        input_strings << line.chomp.to_s
    end
end
result = []

input_strings.each do |s|
    input = s.half_split
    if input.first.nil? or s.length.odd?
        result << -1
    elsif input.first.anagram?(input.last) 
        result << 0 
    else
        h1 = input.first.frequency_hash
        h2 = input.last.frequency_hash

        hash_diff = h1.diff(h2).values
        result << hash_diff.inject(0) { |res, ele| res += ele; res }
        result
    end
    result
end
print result