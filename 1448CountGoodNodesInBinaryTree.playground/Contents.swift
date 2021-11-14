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
    func goodNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        var result = 0
        traverse(root, maxVal: root!.val, result: &result)
        return result
    }
    
    private func traverse(_ root: TreeNode?, maxVal: Int, result: inout Int) {
        if root == nil { return }
        
        if root!.val >= maxVal {
            result += 1
        }
        let updatedMax = max(maxVal, root!.val)
        
        traverse(root?.left, maxVal: updatedMax, result: &result)
        traverse(root?.right, maxVal: updatedMax, result: &result)
    }
}

var root = TreeNode(3, TreeNode(1, TreeNode(3), nil), TreeNode(4, TreeNode(1), TreeNode(5)))
Solution().goodNodes(root)
// Output: 4

root = TreeNode(3, TreeNode(3, TreeNode(4), TreeNode(2)), nil)
Solution().goodNodes(root)
// Output: 3

root = TreeNode(1)
Solution().goodNodes(root)
// Output: 1
