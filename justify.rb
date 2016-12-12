class Justify

  def change_justify(fname, lwidth)
    begin
      lines = IO.readlines(fname)
      lines.each do |line|
        num_lines = (line.length / lwidth) + 1
        num_lines.times do |n|
          start_line = n*lwidth
          end_line = start_line + lwidth -1
          puts "%#{lwidth}s" % line[start_line..end_line]
        end
      end
    rescue
      puts "Exception...."
    end
  end


end

j = Justify.new
j.change_justify('justify.txt',80)
