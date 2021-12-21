import UIKit

/*
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
  

 Example 1:


 Input: root = [2,1,3]
 Output: true
 Example 2:


 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
*/

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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        return isValid(root, nil, nil)
    }
    
    private func isValid(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        if root == nil { return true }
        
        if let minVal = min, root!.val <= minVal {
            return false
        } else if let maxVal = max, root!.val >= maxVal {
            return false
        } else {
            print("min: \(min)")
            print("root.val: \(root!.val)")
            print("max: \(max)")
            return isValid(root?.left, min, root?.val) && isValid(root?.right, root?.val, max)
        }
    }
}

//Solution().isValidBST(TreeNode(2, TreeNode(1), TreeNode(3)))
//Solution().isValidBST(TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6))))
Solution().isValidBST(TreeNode(5, TreeNode(1), TreeNode(8, TreeNode(6), TreeNode(9))))
