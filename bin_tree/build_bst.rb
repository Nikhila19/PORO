class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def build_from_array(arr, l, r)
    # builds a binary tree in order
    return if l > r
    mid = l + ((r - l)/2).floor
    node = BSTNode.new(arr[mid])

    node.left = build_from_array(arr, l, mid-1)
    node.right = build_from_array(arr, mid+1, r)
    return node    
  end

  def traverse_in_order(node)
    return if node.nil?
    traverse_in_order(node.left)
    node.visit
    traverse_in_order(node.right)
  end

end

class BSTNode
  attr_accessor :value, :visit, :right, :left
  def initialize(val)
    @value = val
    @left, @right = nil, nil
  end

  def visit
    print "#{value} ->"
  end

end


input = [1,2,3,4,5,6,7,8,9]
bst = BinarySearchTree.new
bst.root = bst.build_from_array(input, 0,8)
bst.traverse_in_order(bst.root)