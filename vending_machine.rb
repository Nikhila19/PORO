class VendingMachine
  @@denominations = [25,10,5,1]

  def turnChange(value, idx)
    return 0 if value < 1
    # idx = @@denominations.find_index { |den| den <= value }
    # den = @@denominations[idx]
    den = @@denominations[idx]
    # puts "value=#{value}; idx=#{idx}"
    num = value/den
    # puts "num= #{num}"
    rem = value % den
    # puts "rem= #{rem}"
    numCoins = num + turnChange(value % den, idx+1)
    return numCoins
  end
end

vm = VendingMachine.new
puts vm.turnChange(23, 0)
puts vm.turnChange(20, 0)