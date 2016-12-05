#Exercise 3.4: Sorting a stack
require './stack'

class SortStack
  def initialize(st)
    puts "in init #{st.traverse}"
    @given_stack = st.clone
    @sorted_stack = Stack.new
    puts "in init #{@given_stack.traverse}"
  end

  def sort
    while (!@given_stack.empty?)
      counter = 0
      curr_item = @given_stack.pop
      sorted_top = @sorted_stack.peek
      @sorted_stack.push(curr_item) if sorted_top.nil? || sorted_top < curr_item
      
      while(sorted_top && sorted_top > curr_item)
        @given_stack.push(@sorted_stack.pop)
        counter += 1
        sorted_top = @sorted_stack.peek
      end
      if counter > 0
        @sorted_stack.push(curr_item)
        put_into_sorted(counter) 
      end
    end

    put_back_items
  
  end

  def put_into_sorted(ctr)
    while (ctr > 0)
      @sorted_stack.push(@given_stack.pop)
      ctr -= 1
    end
  end
  def put_back_items
    while(!@sorted_stack.empty?)
      @given_stack.push(@sorted_stack.pop)
    end
  end

  def print_sorted_stack
    @given_stack.traverse
  end

end

st = Stack.new
[11,19,9,8,14,5,1].each { |i| st.push(i) }
st.traverse

ss = SortStack.new(st)
ss.sort
ss.print_sorted_stack