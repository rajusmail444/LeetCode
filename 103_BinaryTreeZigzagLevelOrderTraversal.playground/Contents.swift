import UIKit

/*
 Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[20,9],[15,7]]
 
 Example 2:
 Input: root = [1]
 Output: [[1]]
 
 Example 3:
 Input: root = []
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 2000].
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var results = [[Int]]()
        var queue = [root]
        var counter = 0
        while !queue.isEmpty {
            let count = queue.count
            var currentLvl = [Int]()
            for i in 0..<count {
                let counterNode = queue.removeFirst()
                
                if let left = counterNode?.left {
                    queue.append(left)
                }
                if let right = counterNode?.right {
                    queue.append(right)
                }
                
                if counter % 2 == 0{
                    currentLvl.append(counterNode!.val)
                } else {
                    currentLvl.insert(counterNode!.val, at: 0)
                }
            }
            counter += 1
            results.append(currentLvl)
        }
        
        return results
    }
}

let root = TreeNode(3,
                    TreeNode(9),
                    TreeNode(20, TreeNode(15), TreeNode(7)
                    ))

let results = Solution().zigzagLevelOrder(root)
print(results)

