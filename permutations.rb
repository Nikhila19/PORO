# This programs computes all permutations of a given string. 
# The input string has to be sorted
# The implementation is based on the description in 
# http://www.geeksforgeeks.org/write-a-c-program-to-print-all-permutations-of-a-given-string/

class Permutations
  def self.permute(str, l, r)
    print "working with #{str}, #{l}, #{r}"
    puts ""
    if l == r
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{str}"
    else 
      achars = str.chars

      for i in l..r
        s = swap(achars, l, i)
        # puts "s after swapping #{l} AND #{i} = #{s} "
        permute(s, l+1, r) # keeping chars from 0 to (current level) intact
        swap(achars, l, i)

      end
    end
  end

  def self.swap(schars, a, b)
    # print "in swap; #{schars}, #{a}, #{b}"
    return schars if a < 0 || b >= schars.length
    temp = schars[a]
    schars[a] = schars[b]
    schars[b] = temp
    # print "; returning.... #{schars.join}"
    # puts ""
    schars.join
  end
end

Permutations.permute('ABCD',0, 3)