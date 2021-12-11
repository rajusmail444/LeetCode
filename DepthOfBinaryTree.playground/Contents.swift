import UIKit

/*
    Question: Maximum Depth of Binary Tree
    
    Given a binary tree, find its maximum depth.
 
    The Maximum depth is the number of nodes along the longest path from the rout node down to the farthest leaf node.
    Note: A leaf is a node with no children.
 
    Given binary tree [3, 9, 20, null, null, 15, 7], its depth is 3
 */

final class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
}

final class MaximumDepthCalculator {
    static func calculate(_ node: TreeNode?) -> Int {
        guard let rootNode = node else { return 0 }
        print("node -> \(rootNode.val)")
        let leftSideNodeDepth = calculate(rootNode.left) + 1
        let rightSideNodeDepth = calculate(rootNode.right) + 1
        print("leftSideNodeDepth -> \(leftSideNodeDepth)")
        print("rightSideNodeDepth -> \(rightSideNodeDepth)")
        return max(leftSideNodeDepth, rightSideNodeDepth)
    }
}

let rootNode = TreeNode(val: 3)
rootNode.left = TreeNode(val: 9)
rootNode.right = TreeNode(val: 20)
rootNode.right?.left = TreeNode(val: 15)
rootNode.right?.right = TreeNode(val: 7)

let answer = MaximumDepthCalculator.calculate(rootNode)
print("max depth is: \(answer)")
