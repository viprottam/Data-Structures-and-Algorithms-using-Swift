class Stack<T> {
	var stk = [T]()
	
	public init() {}

	public func push(_ value : T) {
		stk.append(value)
	}
	
	public func pop() -> T? {
		return stk.popLast()
	}
	
	public func top() -> T? {
		return stk.last
	}
	
	public func display() {
		print(stk)	
	}

	public var isEmpty: Bool {
		return stk.isEmpty
	}
	
	public var count : Int {
		return stk.count
	}
}

class Queue<T> {
	fileprivate var que = [T]()
	fileprivate var head : Int = 0

	public init() {}

	public func add(_ value : T) {
		que.append(value)
	}
	
	public var isEmpty: Bool {
 		return count == 0
 	}

 	public var count: Int {
 		return que.count - head
 	}

	public func remove() -> T? {
		guard head < que.count else { 
			return nil 
		}
		let element = que[head]
		head += 1

		// Minimum 50 elements need to be freed.
		// One forth of the of total elements need to be freed.
		if(head > 50 && head * 4 > count) {
			que.removeFirst(head)
			head = 0
			print("array size modified.")
		}
		
		return element
	}

	public func front() -> T? {
		guard head < que.count else { 
			return nil 
		}
		return que[head]
	}
}


public class BinaryTree {
	public class Node {
		var value : Int
		var left : Node?
		var right : Node?

		public init(_ value : Int) {
			self.value = value
			self.left = nil
			self.right = nil
		}

		public init() {
			self.value = 0
			self.left = nil
			self.right = nil
		}

	}
	private var root : Node?

	init() {
		self.root = nil
	}

	// Other Methods


public func levelOrder(arr : [Int]) -> BinaryTree {
	let tree = BinaryTree()
	tree.root = levelOrderUtil(arr : arr, start : 0, size : arr.count)
	return tree
}

private func levelOrderUtil(arr : [Int], start : Int, size : Int) -> Node {
	let curr = Node(arr[start])
	let left = 2*start + 1
	let right = 2*start + 2

	if left < size {
		curr.left = levelOrderUtil(arr : arr, start : left, size : size)
	}
	if right < size {
		curr.right = levelOrderUtil(arr : arr, start : right, size : size)
	}
	return curr
}

public func add(value : Int) {
	self.root = addUtil(curr : self.root, value : value)
}

private func addUtil(curr : Node?, value : Int) -> Node {
	guard let curr = curr else {
		let temp = Node(value)
		return temp
	}

	if value < curr.value {
		curr.left = addUtil(curr : curr.left, value : value)
	} else {
		curr.right = addUtil(curr : curr.right, value : value)
	}
	return curr
}

public func printPreOrder() {
	printPreOrderUtil(curr : self.root)
	print()
}

private func printPreOrderUtil(curr : Node?) {
	guard let curr = curr else {
		return
	}
	print(curr.value, terminator: " ")
	printPreOrderUtil(curr : curr.left)
	printPreOrderUtil(curr : curr.right)
}

public func printPostOrder() {
	printPostOrderUtil(curr : self.root)
	print()
}

private func printPostOrderUtil(curr : Node?) {
	guard let curr = curr else {
		return
	}
	printPostOrderUtil(curr : curr.left)
	printPostOrderUtil(curr : curr.right)
	print(curr.value, terminator: " ")
}
public func printInOrder() {
	printInOrderUtil(curr : self.root)
	print()
}

func printInOrderUtil(curr : Node?) {
	guard let curr = curr else {
		return
	}
	printInOrderUtil(curr : curr.left)
	print(curr.value, terminator: " ")
	printInOrderUtil(curr : curr.right)
}

class func Sort(_ values : inout [Int]) {
	let t = BinaryTree()
	for v in values {
		t.add(value : v)
	}
	values = []
	appendValues(values : &values, curr : t.root)
}

// appendValues appends the elements of curr to values in order
// and returns the resulting slice.
class func appendValues(values : inout [Int], curr : Node?) {
	guard let curr = curr else {
		return
	}
	appendValues(values : &values, curr : curr.left)
	values.append(curr.value)
	appendValues(values : &values, curr : curr.right)
}

public func printBredthFirst() {
	let que = Queue<Node>()
	if self.root != nil {
		que.add(self.root!)
	}

	while let temp = que.remove() {
		print(temp.value, terminator: " ")
		if temp.left != nil {
			que.add(temp.left!)
		}
		if temp.right != nil {
			que.add(temp.right!)
		}
	}
	print()
}

public func PrintDepthFirst() {
	let stk = Stack<Node>()
	if self.root != nil {
		stk.push(self.root!)
	}

	while let temp = stk.pop() {
		print (temp.value, terminator:" ")
		if temp.right != nil {
			stk.push(temp.right!)
		}
			
		if temp.left != nil {
			stk.push(temp.left!)
		}
		
	}
	print()
}


public func nthPreOrder(index : Int) {
	var counter : Int = 0
	nthPreOrderUtil(curr : self.root, index : index, counter : &counter)
}

private func nthPreOrderUtil(curr : Node?, index : Int, counter : inout Int) {
	guard let curr = curr else {
		return
	}
	counter += 1
	if counter == index {
		print(curr.value)
	}
	nthPreOrderUtil(curr : curr.left, index : index, counter : &counter)
	nthPreOrderUtil(curr : curr.right, index : index, counter : &counter)
}

public func nthPostOrder(index : Int) {
	var counter : Int = 0
	nthPostOrderUtil(curr : self.root, index : index, counter : &counter)
}

private func nthPostOrderUtil(curr : Node?, index : Int, counter : inout Int) {
	guard let curr = curr else {
		return
	}
	nthPostOrderUtil(curr : curr.left, index : index, counter : &counter)
	nthPostOrderUtil(curr : curr.right, index : index, counter : &counter)
	counter += 1
	if counter == index {
		print(curr.value)
	}
}

public func nthInOrder(index : Int) {
	var counter : Int = 0
	nthInOrderUtil(curr : self.root, index : index, counter : &counter)
}

private func nthInOrderUtil(curr : Node?, index : Int, counter : inout Int) {
	guard let curr = curr else {
		return
	}
	nthInOrderUtil(curr : curr.left, index : index, counter : &counter)
	counter += 1
	if counter == index {
		print(curr.value)
	}
	nthInOrderUtil(curr : curr.right, index : index, counter : &counter)
}

public func find(value : Int) -> Bool {
	var node : Node? = self.root
	while let curr = node {
		if curr.value == value {
			return true
		} else if curr.value > value {
			node = curr.left
		} else {
			node = curr.right
		}
	}
	return false
}

public func findMin() -> (value : Int, flag : Bool) {
	guard var curr = self.root else {
		print("EmptyTreeException")
		return (0, false)
	}

	while let next = curr.left {
		curr = next
	}
	return (curr.value, true)
}

public func findMax() -> (value : Int, flag : Bool) {
	guard var curr = self.root else {
		print("EmptyTreeException")
		return (0, false)
	}

	while let next = curr.right{
		curr = next
	}
	return (curr.value, true)
}

public func findMaxNode() -> Node? {
	guard var curr = self.root else {
		print("EmptyTreeException")
		return nil
	}

	while let next = curr.right{
		curr = next
	}
	return curr
}

public func findMinNode() -> Node? {
	guard var curr = self.root else {
		return nil
	}

	while let next = curr.left {
		curr = next
	}
	return curr
}

public func findMax(curr : Node?) -> Int {
	guard var curr = curr else {
		print("EmptyTreeException")
		return 0
	}
	while let next = curr.right {
		curr = next
	}
	return curr.value
}

public func findMin(curr : Node?) -> Int {
	guard var curr = curr else {
		print("EmptyTreeException")
		return 0
	}

	while let next = curr.left {
		curr = next
	}
	return curr.value
}

public func free() {
	self.root = nil
}

public func deleteNode(value : Int) {
	self.root = deleteNode(curr : self.root, value : value)
}

private func deleteNode(curr : Node?, value : Int) -> Node? {
	guard let curr = curr else {
		return nil
	}

	if curr.value == value {
		if curr.left == nil && curr.right == nil {
			return nil
		}
		if curr.left == nil {
			return curr.right
		}
		if curr.right == nil {
			return curr.left
		}
		let maxValue = findMax(curr : curr.left)
		curr.value = maxValue
		curr.left = deleteNode(curr : curr.left, value : maxValue)
	} else {
		if curr.value > value {
			curr.left = deleteNode(curr : curr.left, value : value)
		} else {
			curr.right = deleteNode(curr : curr.right, value : value)
		}
	}
	return curr
}

public func treeDepth() -> Int {
	return treeDepth(curr : self.root)
}

private func treeDepth(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}
	let lDepth = treeDepth(curr : curr.left)
	let rDepth = treeDepth(curr : curr.right)

	if lDepth > rDepth {
		return lDepth + 1
	}
	return rDepth + 1
}

public func isEqual(t : BinaryTree) -> Bool {
	return isEqual(node1 : self.root, node2 : t.root)
}

private func isEqual(node1 : Node?, node2 : Node?) -> Bool {
	if node1 == nil && node2 == nil {
		return true
	} 
	
	else if node1 == nil || node2 == nil {
		return false
	} else {
		return ((node1!.value == node2!.value) &&
			isEqual(node1 : node1!.left, node2 : node2!.left) &&
			isEqual(node1 : node1!.right, node2 : node2!.right))
	}
}

public func ancestor(first : Int, second : Int) -> Node? {
	if first < second {
		return ancestor(curr : self.root, first : first, second : second)
	} else {
		return ancestor(curr : self.root, first : first, second : second)
	}
	
}

private func ancestor(curr : Node?, first : Int, second : Int) -> Node? {
	guard let curr = curr else {
		return nil
	}
	if curr.value > first && curr.value > second {
		return ancestor(curr : curr.left, first : first, second : second)
	}
	if curr.value < first && curr.value < second {
		return ancestor(curr : curr.right, first : first, second : second)
	}
	return curr
}

public func copyTree() -> BinaryTree {
	let tree2 = BinaryTree()
	tree2.root = copyTree(curr : self.root)
	return tree2
}

private func copyTree(curr : Node?) -> Node? {
	guard let curr = curr else {
		return nil
	}
	let temp = Node(curr.value)
	temp.left = copyTree(curr : curr.left)
	temp.right = copyTree(curr : curr.right)
	return temp
}

public func copyMirrorTree() -> BinaryTree {
	let tree = BinaryTree()
	tree.root = copyMirrorTree(curr : self.root)
	return tree
}

private func copyMirrorTree(curr : Node?) -> Node? {
	guard let curr = curr else {
		return nil
	}
	let temp = Node(curr.value)
	temp.right = copyMirrorTree(curr : curr.left)
	temp.left = copyMirrorTree(curr : curr.right)
	return temp
}

public func numNodes() -> Int {
	return numNodes(curr : self.root)
}

private func numNodes(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}
	return (1 + numNodes(curr : curr.right) + numNodes(curr : curr.left))
}

public func numFullNodesBT() -> Int {
	return numFullNodesBT(curr : self.root)
}

private func numFullNodesBT(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}

	var count = numFullNodesBT(curr : curr.right) + numFullNodesBT(curr : curr.left)
	if curr.right != nil && curr.left != nil {
		count += 1
	}
	return count
}

public func maxLengthPathBT() -> Int {
	return maxLengthPathBT(curr : self.root)
}

private func maxLengthPathBT(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}

	let leftPath = treeDepth(curr : curr.left)
	let rightPath = treeDepth(curr : curr.right)
	var max = leftPath + rightPath + 1

	let leftMax = maxLengthPathBT(curr : curr.left)
	let rightMax = maxLengthPathBT(curr : curr.right)
	if leftMax > max {
		max = leftMax
	}

	if rightMax > max {
		max = rightMax
	}
	return max
}

public func numLeafNodes() -> Int {
	return numLeafNodes(curr : self.root)
}

private func numLeafNodes(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}

	if curr.left == nil && curr.right == nil {
		return 1
	}
	return (numLeafNodes(curr : curr.right) + numLeafNodes(curr : curr.left))
}

public func sumAllBT() -> Int {
	return sumAllBT(curr : self.root)
}

private func sumAllBT(curr : Node?) -> Int {
	guard let curr = curr else {
		return 0
	}
	let rightSum = sumAllBT(curr : curr.right)
	let leftSum = sumAllBT(curr : curr.left)
	return rightSum + leftSum + curr.value
}

public func isBST3(curr : Node?) -> Bool {
	guard let curr = curr else {
		return true
	}
	if curr.left != nil && findMax(curr : curr.left) > curr.value {
		return false
	}
	if curr.right != nil && findMin(curr : curr.right) <= curr.value {
		return false
	}
	return (isBST3(curr : curr.left) && isBST3(curr : curr.right))
}

public func isBST() -> Bool {
	return isBST(curr : self.root, min : Int.min, max : Int.max)
}

private func isBST(curr : Node?, min : Int, max : Int) -> Bool {
	guard let curr = curr else {
		return true
	}

	if curr.value < min || curr.value > max {
		return false
	}
	return isBST(curr : curr.left, min : min, max : curr.value) && 
	isBST(curr : curr.right, min : curr.value, max : max)
}

public func isBST2() -> Bool {
	var c : Int = Int.min
	return isBST2(curr : self.root, count : &c)
}

private func isBST2(curr : Node?, count : inout Int) -> Bool {
	guard let curr = curr else {
		return true
	}	
	var ret = isBST2(curr : curr.left, count : &count)
	if !ret {
		return false
	}
	if count > curr.value {
		return false
	}
	count = curr.value
	ret = isBST2(curr : curr.right, count : &count)
	if !ret {
		return false
	}
	return true
}

public func printAllPath() {
	var stk = Stack<Int>()
	printAllPath(curr : self.root, stk : &stk)
}

private func printAllPath(curr : Node?, stk : inout Stack<Int>) {
	guard let curr = curr else {
		return
	}
	stk.push(curr.value)
	if curr.left == nil && curr.right == nil {
		stk.display()
		_ = stk.pop()
		return
	}
	printAllPath(curr : curr.right, stk : &stk)
	printAllPath(curr : curr.left, stk : &stk)
	_ = stk.pop()
}


public func lca(first : Int, second : Int) -> (value : Int, flag : Bool) {
	let ans = lcaUtil(curr : self.root, first : first, second : second)
	if ans != nil {
		return (ans!.value, true)
	}
	print("NotFoundException")
	return (0, false)
}

private func lcaUtil(curr : Node?, first : Int, second : Int) -> Node? {
	guard let curr = curr else {
		return nil
	}

	if curr.value == first || curr.value == second {
		return curr
	}

	let left = lcaUtil(curr : curr.left, first : first, second : second)
	let right = lcaUtil(curr : curr.right, first : first, second : second)

	if left != nil && right != nil {
		return curr
	} else if left != nil {
		return left
	} else {
		return right
	}
}

public func lcaBST(first : Int, second : Int) -> (value : Int, flag : Bool) {
	return lcaBST(curr : self.root, first : first, second : second)
}

private func lcaBST(curr : Node?, first : Int, second : Int) -> (value : Int, flag : Bool) {
	guard let curr = curr else {
		print("NotFoundException")
		return (0, false)
	}

	if curr.value > first && curr.value > second {
		return lcaBST(curr : curr.left, first : first, second : second)
	}
	if curr.value < first && curr.value < second {
		return lcaBST(curr : curr.right, first : first, second : second)
	}
	return (curr.value, true)
}

public func trimOutsideRange(min : Int, max : Int) {
	self.root = trimOutsideRange(curr : self.root, min : min, max : max)
}

private func trimOutsideRange(curr : Node?, min : Int, max : Int) -> Node? {
	guard let curr = curr else {
		return nil
	}
	curr.left = trimOutsideRange(curr : curr.left, min : min, max : max)
	curr.right = trimOutsideRange(curr : curr.right, min : min, max : max)
	if curr.value < min {
		return curr.right
	}
	if curr.value > max {
		return curr.left
	}
	return curr
}

public func printDataInRange(min : Int, max : Int) {
	printDataInRange(curr : self.root, min : min, max : max)
}

private func printDataInRange(curr : Node?, min : Int, max : Int) {
	guard let curr = curr else {
		return
	}
	printDataInRange(curr : curr.left, min : min, max : max)
	if curr.value >= min && curr.value <= max {
		print(curr.value)
	}
	printDataInRange(curr : curr.right, min : min, max : max)
}

public func floorBST(val : Int) -> Int {
	var curr = self.root
	var floor = Int.max

	while curr != nil {
		if curr!.value == val {
			floor = curr!.value
			break
		} else if curr!.value > val {
			curr = curr!.left
		} else {
			floor = curr!.value
			curr = curr!.right
		}
	}
	return floor
}

public func ceilBST(val : Int) -> Int {
	var curr = self.root
	var ceil = Int.min

	while curr != nil {
		if curr!.value == val {
			ceil = curr!.value
			break
		} else if curr!.value > val {
			ceil = curr!.value
			curr = curr!.left
		} else {
			curr = curr!.right
		}
	}
	return ceil
}

public func findMaxBT() -> Int {
	return findMaxBT(curr : self.root)
}

private func findMaxBT(curr : Node?) -> Int {
	guard let curr = curr else {
		return Int.min
	}
	var max = curr.value

	let left = findMaxBT(curr : curr.left)
	if left > max {
		max = left
	}

	let right = findMaxBT(curr : curr.right)
	if right > max {
		max = right
	}
	return max
}


public func searchBT(value : Int) -> Bool {
	return searchBT(curr : self.root, value : value)
}

public func searchBT(curr : Node?, value : Int) -> Bool {
	guard let curr = curr else {
		return false
	}
	if curr.value == value {
		return true
	}

	let left = searchBT(curr : curr.left, value : value)
	if left {
		return true
	}
	let right = searchBT(curr : curr.right, value : value)
	if right {
		return true
	}
	return false
}

class func createBinaryTree(_ arr : [Int]) -> BinaryTree {
	let t = BinaryTree()
	let size = arr.count
	t.root = createBinaryTreeUtil(arr : arr, start : 0, end : size-1)
	return t
}

class func createBinaryTreeUtil(arr : [Int], start : Int, end : Int) -> Node? {
	if start > end {
		return nil
	}

	let mid = (start + end) / 2
	let curr = Node(arr[mid])
	curr.left = createBinaryTreeUtil(arr : arr, start : start, end : mid-1)
	curr.right = createBinaryTreeUtil(arr : arr, start : mid+1, end : end)
	return curr
}

}
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var t = BinaryTree.createBinaryTree(arr)
t.printBredthFirst()
t.PrintDepthFirst()
t.printInOrder()
t.printPreOrder()
t.printPostOrder()
t.add(value:2)
t.add(value:1)
t.add(value:3)
t.add(value:4)
t.printPreOrder()
t.printPostOrder()
t.printInOrder()
print(t.nthPreOrder(index:2))
print(t.nthPostOrder(index:2))
print(t.nthInOrder(index:2))
t.printAllPath()
print(t.findMax())
print(t.findMin())
var lst = [2, 1, 3, 4]
BinaryTree.Sort(&lst)
print(lst)