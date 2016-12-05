
class Stack

  def initiliaze
    @top = nil
  end

  def push(val)
    n = StackNode.new(val)
    
    n.next = @top 
    @top = n
  end

  def pop
    return nil if @top.nil?
    n = @top
    @top = n.next
    return n.value
  end

  def peek
    return nil if @top.nil?
    return @top.value
  end

  def empty?
    @top.nil?
  end

  def traverse
    curr = @top
    print "#{curr.value} -> " if curr
    return unless curr

    while(curr.next)
      curr = curr.next
      print "#{curr.value} -> "
    end
    puts ""
  end

end

class StackNode
  attr_accessor :value, :next

  def initialize(val)
    @value = val
    @next = nil
  end
end