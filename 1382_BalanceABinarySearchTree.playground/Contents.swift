import UIKit

/*
 Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

 A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

 Example 1:
 Input: root = [1,null,2,null,3,null,4,null,null]
 Output: [2,1,3,null,null,null,4]
 Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
 
 Example 2:
 Input: root = [2,1,3]
 Output: [2,1,3]
  
 Constraints:
 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 105
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
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        var results = [TreeNode]()
        inOrderTraversal(root, &results)
        return build(results, 0, results.count-1)
    }
    
    private func inOrderTraversal(_ root: TreeNode?, _ results: inout [TreeNode]) {
        if root == nil { return }
        
        inOrderTraversal(root?.left, &results)
        results.append(root!)
        inOrderTraversal(root?.right, &results)
    }
    
    private func build(_ results: [TreeNode], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        let mid = start + (end - start)/2
        let midVal = results[mid]
        midVal.left = build(results, start, mid-1)
        midVal.right = build(results, mid+1, end)
        print("->: \(midVal.val)")
        return midVal
    }
}

var root = TreeNode(1, nil, TreeNode(2, nil, TreeNode(3, nil, TreeNode(4))))
Solution().balanceBST(root)
