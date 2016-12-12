class ZeroMatrix
  def self.find_zero_matrix(arr)
    

    cols = arr[0].length
    rows = arr.length
    puts "The given matrix is #{arr}. It has #{rows} rows and #{cols} cols"
    arr[rows] = Array.new(cols, false)

    for i in 0..rows
      arr[i] << false
    end
    puts "The given matrix after adding last row/col is #{arr}. It has #{arr.length} rows and #{arr[0].length} cols"

    for i in 0..rows-1
      for j in 0..cols-1
        if arr[i][j] == 0 && !arr[i][rows] 
          arr[i][cols] = true
          arr[rows][j] = true
        end
      end
    end

    puts "The matrix with flags is #{arr}"

    for i in 0..rows-1
      if arr[i][cols]
        puts "Row #{i} is to be made all zeroes"
        arr[i].fill(0, 0, cols-1) 
      end
    end

    for i in 0..cols-1
      if arr[rows][i]
        for j in 0..rows-1
          arr[j][i] = 0
        end
      end
    end
    for i in 0..rows-1
      puts "The modified matrix is #{arr[i]}"
    end

  end
end

a = Array.new(4)
for i in 0..a.length
  a[i] = [5,5,5,5]
end
a[0][2] = 0
a[3][3] = 0
ZeroMatrix.find_zero_matrix(a)