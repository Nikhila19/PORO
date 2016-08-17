#!/usr/bin/env ruby
ARGF.each_with_index do |line, idx|
  puts "#{idx} : #{line}"
end

