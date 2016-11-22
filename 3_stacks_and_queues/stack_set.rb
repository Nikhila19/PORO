#Ex 3.3: Set of Stacks

class StackSet

  attr_accessor :stackSize

  @@StackInstances = []
  @@activeInstanceIndex = nil

  def self.push(val)
    activeInstance = @@StackInstances[@@activeInstanceIndex] unless @@activeInstanceIndex.nil?
    if activeInstance.nil? || activeInstance.reachedThreshold?
      @@StackInstances << StackSet.new
      @@activeInstanceIndex = @@StackInstances.length - 1 
    end
    activeInstance = @@StackInstances[@@activeInstanceIndex]
    activeInstance.push(val)
  end

  def self.pop
    return nil unless @@activeInstanceIndex
    activeInstance = @@StackInstances[@@activeInstanceIndex]
    activeInstance.pop 

    if activeInstance.stackSize == 0 && @@activeInstanceIndex != 0
      @@activeInstanceIndex -= 1 
    elsif activeInstance.stackSize == 0 && @@activeInstanceIndex == 0
      @@activeInstanceIndex = nil
    end
  end

  def self.status
    if @@activeInstanceIndex
      ins = @@StackInstances[@@activeInstanceIndex] 
      puts "Stack number #{@@activeInstanceIndex} has size of #{ins.stackSize}"
      @@StackInstances.each { |ai| puts ai.traverse; puts "" }
      
    else
      puts "All stacks empty"
    end
  end

  def initialize
    @threshold = 10
    @stackSize = 0
    @top = nil
  end

  def push(val)
    return nil if @stackSize == @threshold
    n = StackNode.new(val) 
    unless @top
      @top = n
    else
      n.next = @top
      @top = n
    end

    @stackSize += 1
    return @stackSize
  end

  def pop
    return nil unless @top
    n = @top
    @top = n.next
    @stackSize -= 1
    return n.value
  end

  def reachedThreshold?
    @threshold == @stackSize
  end

  def traverse
    curr = @top
    while curr != nil
      print "#{curr.value} => "
      curr = curr.next
    end
  end

end

class StackNode
  attr_accessor :value, :next

  def initialize(val)
    @value = val
    @next = nil
  end
end

(33..45).each {|i| StackSet.push(i) }
StackSet.push(10)
StackSet.status
(1..4).each {|q| StackSet.pop }
StackSet.status
StackSet.push(23)
StackSet.status
