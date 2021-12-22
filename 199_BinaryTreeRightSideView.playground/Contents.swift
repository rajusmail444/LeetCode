import UIKit

/*
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example 1:
 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
 
 Example 2:
 Input: root = [1,null,3]
 Output: [1,3]
 
 Example 3:
 Input: root = []
 Output: []
  
 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var queue = [root]
        var results = [Int]()
        while !queue.isEmpty {
            let count = queue.count
            
            for i in 0..<count {
                let currentNode = queue.removeFirst()
                
                if let right = currentNode?.right {
                    queue.append(right)
                }
                if let left = currentNode?.left {
                    queue.append(left)
                }
                
                if i == 0 {
                    results.append(currentNode!.val)
                }
            }
        }
        print("results: \(results)")
        return results
    }
}

Solution().rightSideView(
    TreeNode(1,
             TreeNode(2, nil, TreeNode(5)),
             TreeNode(3, nil, TreeNode(4))
    )
)
