
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

  def empty?
    @top.nil?
  end

end

class StackNode
  attr_accessor :value, :next

  def initialize(val)
    @value = val
    @next = nil
  end
end