class Solution {
    func moveZeros(_ nums: inout [Int]) {
        if nums.count < 1 {
            return
        }
        for i in 0 ..< nums.count {
            if nums[i] == 0 {
                var j = i
                var shouldContinue: Bool = true
                
                while j < nums.count && shouldContinue {
                    if nums[j] != 0 {
                        nums.swapAt(i, j)
                        shouldContinue = false
                    }
                    j += 1
                }
            }
        }
    }
}

var nums = [0,0,1]
Solution().moveZeros(&nums)

