class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.count <= 1 { return 0 }
        
        let intervals = intervals.sorted { $0[1] < $1[1]}
        
        var result = 0
        var currentMin = Int.min
        for i in 0 ..< intervals.count {
            if intervals[i][0] >= currentMin {
                currentMin = intervals[i][1]
            } else {
                result += 1
            }
        }
        return result
    }
}

Solution().eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])

Solution().eraseOverlapIntervals([[1,2],[1,2],[1,2]])
