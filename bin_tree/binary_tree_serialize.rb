class Node
  attr_accessor :left, :right, :value
  @left = nil
  @right = nil
  @value = -1
end

class BinaryTree
  attr_accessor :root, :fileName, :index, :bt_array
  EMPTY_NODE = -1

  def initialize
    @fileName = "/Users/nikhila.rao/Documents/Nikhila/Training/PORO/binary_tree_serialize.txt" 
    @root = nil
    @index = 0
    @bt_array = []
  end

  def newNode(value)
    n = Node.new
    n.value = value
    n
  end

  def file_open
    filePtr = File.open(@fileName, "w+")
  end

  def file_close(fptr)
    fptr.close 
  end

  def make_array(fp)
    fPtr.read_line
    vals.split(" -> ")

  def serialize(node, filePtr)
    if node.nil?
      filePtr.write "-1 -> "
      print "-1 -> "
      return EMPTY_NODE 
    end

    filePtr.write "#{node.value} -> " # write self
    print "#{node.value} -> " 
    serialize(node.left, filePtr) #recurse thru left nodes
    serialize(node.right, filePtr)

  end

  def deserialize
    arr = @bt_array
    return nil if @index >= arr.length || arr[@index] == EMPTY_NODE
    node = Node.new
    node.value = arr[@index]
    print "#{node.value}"
    @index = @index + 1
    node.left = deserialize(arr)
    node.right = deserialize(arr)
    node
  end

end

bt = BinaryTree.new
bt.root = bt.newNode(20)
bt.root.left = bt.newNode(8)
bt.root.right = bt.newNode(22)
bt.root.left.left = bt.newNode(4)
bt.root.left.right = bt.newNode(12)
bt.root.left.right.left = bt.newNode(10)
bt.root.left.right.right = bt.newNode(14)

# puts "#{bt.root.value} - #{bt.root.left.value} - #{bt.root.right.value} - #{bt.root.right.value} - #{bt.root.left.left.value}"
fp = bt.file_open
bt.serialize(bt.root, fp)
bt.file_close fp
puts "******** DESERIALIZE *********"
bin_tree = BinaryTree.new
bin_tree.root = deserialize



