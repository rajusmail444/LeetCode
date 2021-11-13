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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        root.left = pruneTree(root.left)
        root.right = pruneTree(root.right)
        
        if root.val == 0 && root.left == nil && root.right == nil {
            return nil
        } else {
            return root
        }
    }
}

let subRoot = TreeNode(1, nil, TreeNode(2))
var root = TreeNode(1, nil, TreeNode(0, nil, TreeNode(1)))

Solution().pruneTree(root)

// Output: [1,null,0,null,1]


