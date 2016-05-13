ARGF.read.each_with_index do |line, idx|
    if idx == 0
        num_lines = line.to_i
    else
        input_strings << line.to_s
    end
end

result = []
# just adding some chnages to commit into git

input_strings.each do |s|
    input = s.half_split
    if input.first.nil?
        result << -1
    elsif input.first.anagram?(input.last) 
        result << 0 
    else
        h1 = input.first.frequency_hash
        h2 = input.last.frequency_hash
        hash_diff = h1.diff(h2).values
        result = hash_diff.inject(0) { |res, ele| res += ele; res }
        result
    end
end

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
        hsh = self.chars.inject(Hash.new(0)) { |res,s| res[s] += 1; res; }
    end
end

class Hash
    def diff(h={})
        res = {}
        self.each do |k,v|
            if h[k] && h[k] > self[k]
                res[k] =  h[k] - v
            elsif h[k] && h[k] < v
                res[k] = v - h[k]
            elsif h[k] && h[k] == v
            else
                res[k] = self[k]
            end            
        end
        puts res
        h.each do |k,v|
            res[k] = v unless self[k]
        end
        puts res
        res
    end
end


