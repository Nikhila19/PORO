class Stream
  attr_accessor :head, :tail

  def initialize(val=0)
    @head = val
    @prev = 0
    @fibo_count = 0
  end

  def nextZero
    val = @head
    @head = Stream.new.head

    return val
  end

  def nextNatural
    val = @head
    @head = Stream.new(val+1).head
  end

  def nextFibo
    # 1,1,2,3,5,8,13,21
    val = @head    
    @prev = val
    @fibo_count = @fibo_count + 1 if val == 1 && @fibo_count <= 2

    @head = Stream.new(val+@prev).head
    return val
  end

end

s = Stream.new(1)
# print "#{s.next} -> "
# print "#{s.next} -> "
# print "#{s.next} -> "


# 10.times { print "#{s.nextZero} -> " }
10.times { print "#{s.nextFibo} -> " }
puts ""

