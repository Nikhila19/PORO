# Ex 3.1 in CTCI
class StackInArray
  def initialize(numStacks=3, stackSize=10)
    @numOfStacks = numStacks
    @maxStackSize = stackSize
    @valuesArray = Array.new(stackSize*numStacks, 0) # holds the values in the stacks
    @topOfStacks = [0,stackSize,2*stackSize] # will hold the topIndex of each stack; where to put the next item
    @stackSizes = [0,0,0] #will hold the size of each stack
  end

  def push(stackNum, val)
    return "Full" if @stackSizes[stackNum] == @maxStackSize

    indexToInsert = @topOfStacks[stackNum]
    @valuesArray[indexToInsert] = val
    @topOfStacks[stackNum] += 1
    @stackSizes[stackNum] += 1
  end

  def pop(stackNum)
    return "Empty" if @topOfStacks[stackNum] == stackNum * @maxStackSize
    indexToRemove = @topOfStacks[stackNum] - 1
    value = @valuesArray[indexToRemove]
    @topOfStacks[stackNum] -= 1
    @stackSizes[stackNum] -= 1
    return value
  end

  def print_stack(stackNum)
    puts @valuesArray.slice(stackNum*@maxStackSize, @maxStackSize)
  end
end

st = StackInArray.new()
st.push(0,5)
st.push(0,10)
st.print_stack(0)

st.push(1,15)
st.push(1,23)
st.print_stack(1)

(33..45).each {|i| st.push(2, i)}
st.print_stack(2)
(1..11).each {|i| puts "popped: #{st.pop(2)}" }
st.push(2,101)
st.print_stack(2)
# puts "popped: #{st.pop(2)}"
# puts "popped: #{st.pop(2)}"


