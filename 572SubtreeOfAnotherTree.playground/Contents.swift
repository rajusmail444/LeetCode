// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil {
            return false
        } else if isSame(root, subRoot) {
            return true
        } else {
            return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
        }
    }
    
    private func isSame(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil || node2 == nil {
            return node1 == nil && node2 == nil
        } else if node1?.val == node2?.val {
            return isSame(node1?.left, node2?.left) && isSame(node1?.right, node2?.right)
        } else {
            return false
        }
    }
}

let subRoot = TreeNode(4, TreeNode(1), TreeNode(2))
let subRootWithZero = TreeNode(4, TreeNode(1), TreeNode(2, TreeNode(0), nil))
var root = TreeNode(3, subRoot, TreeNode(5))

Solution().isSubtree(root, subRoot)
// Output: true

root = TreeNode(3, subRootWithZero, TreeNode(5))
Solution().isSubtree(root, subRoot)
// Output: false

