class MySolution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.isEmpty { return }
        
        let noOfRotations = k%nums.count
        
        for i in 0..<noOfRotations {
            let last = nums.removeLast()
            nums.insert(last, at: 0)
        }
    }
}

// Performance is slow
//Runtime: 1268 ms, faster than 26.31% of Swift online submissions for Rotate Array.
//Memory Usage: 21.4 MB, less than 66.62% of Swift online submissions for Rotate Array.

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.isEmpty { return }
        
        let pivot = k % nums.count
        swap(&nums, 0, nums.count-1)
        swap(&nums, 0, pivot-1)
        swap(&nums, pivot, nums.count-1)
    
    }
    
    private func swap(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        
        while start < end {
            nums.swapAt(start, end)
            
            start += 1
            end -= 1
        }
    }
}

var nums = [1,2,3,4,5,6,7]
Solution().rotate(&nums, 3)
// Output: [5,6,7,1,2,3,4]

nums = [-1,-100,3,99]
Solution().rotate(&nums, 2)
// Output: [3,99,-1,-100]



