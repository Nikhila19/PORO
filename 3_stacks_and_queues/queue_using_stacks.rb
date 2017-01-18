# Exer 3.4: Implementing a Queue using two Stacks
require './stack'

class MyQueue
  
  def initialize
    @regular_stack = Stack.new
    @reverse_stack = Stack.new
  end

  def add(val)
    @regular_stack.push(val)
  end

  def remove
    shift_stacks
    @reverse_stack.pop
  end

  def shift_stacks
    if @reverse_stack.empty?
      while (!@regular_stack.empty?)
        @reverse_stack.push(@regular_stack.pop)
      end
    end
  end

end


q = MyQueue.new
# (20..30).each { |i| q.add(i) }
# (1..11).each { puts q.remove }

q.add 99
q.add 112
puts q.remove
q.add 88
puts q.remove
