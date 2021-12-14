import UIKit

/*
 Question: Convert Sorted Array to Binary Search Tree
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Given the sorted array: [-10, -3, 0, 5, 9],
 
 One possible answer is: [0, -3, 9, -10, null, 5], which represents the following height balanced BST:
 */

final class TreeNode {
    let val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
}

final class SortedArrayToBST {
    func bstThis(_ nums: [Int]) -> TreeNode? {
        return buildBST(nums, min: 0, max: nums.count - 1)
    }
    
    func buildBST(_ nums: [Int], min: Int, max: Int) -> TreeNode? {
        if min > max { return nil }
        if nums.isEmpty { return nil }
        
        // As this is a sorted array, binary search could help us in the case
        // The midpoint should be root of the tree, as it would mean the left side node is smaller than root node, and right side is bigger than root.
        
        // we calculate the midPoint this way to avoid into overflow
        let midPoint = min + (max - min)/2
        let midPointVal = nums[midPoint]
        
        // our rootNode
        let rootNode = TreeNode(val: midPointVal)
        
        // we'll keep build the left side via recurssion
        rootNode.left = buildBST(nums, min: min, max: midPoint-1)
        
        // same case for right
        rootNode.right = buildBST(nums, min: midPoint+1, max: max)
        return rootNode
    }
}
