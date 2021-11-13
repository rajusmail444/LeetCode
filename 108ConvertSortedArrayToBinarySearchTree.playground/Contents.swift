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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty { return nil }
        
        return build(nums, 0, nums.count-1)
    }
    
    private func build(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        
        let mid = start + (end - start)/2
        let root = TreeNode(nums[mid])
        root.left = build(nums, start, mid-1)
        root.right = build(nums, mid+1, end)
        return root
    }
}
