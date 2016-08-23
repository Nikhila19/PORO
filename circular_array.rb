class CircularArray < Array
  attr_accessor :head

  # The way a circular array is implemented is by storing the symbolic head of a linear array
  # Instead of actually rotating the array each time rotate is called, we simply move the head
  # to the start of the array. The circular each is the iterator for the given array

  def initialize(arr=[])
    @head = 0
    super
  end

  def rotate(shift_index=0)
    # if the shift_index is negative, then the value is added to the length to get the positive index
    # Consider shift_index=-1 & array length=6: shift_right + length makes shift_index= 5
    # if head is at 3 to start with, 5 + 3 % 6 = 2 
    # in actuality 3 (current head) - 1(shift index) = 2 
    shift_index += self.length if shift_index < 0
    @head = (shift_index + @head) % self.length
  end

  def circular_each(&block)
    e = Enumerator.new do |y|
      self[@head..length].each { |e| y << e}
      self[0..@head-1].each { |item| y << item }
    end
    if block_given?
      e.each { |item| yield item }
    else
      e.each
    end
  end
end

ca = CircularArray.new([1,2,3,4,5])
ca.rotate(3)
ca.circular_each { |c| puts c }
# Testing a call without providing block
ca.circular_each

