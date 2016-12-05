class Queue
  attr_accessor :head, :tail

  def initialize
    @head, @tail = nil, nil
  end

  def push(v)
    if v.respond_to?(:value)
      n = v
    else
      n = Node.new(v)
    end

    if @head.nil?
      @head = n
      @tail = n
    else
      @tail.next = n
      @tail = n
    end
  
  end

  def pop
    n = @head

    @head = n.next unless n.nil?
    if @head
  else
     # puts "queue empty"
   end
    n
  end

  def traverse
    n = @head
    while (n)
      puts n.value
      n = n.next
    end
  end

  def isEmpty?
    return @head.nil?
  end
end

class Node
    attr_accessor :value, :next

  def initialize(v)
    @value = v
    @next = nil
  end
end

# q = Queue.new
# q.push(9)
# q.push(19)
# q.push(34)
# q.traverse


# q.pop
# q.traverse
# q.pop
# q.traverse
# q.pop
# q.traverse

