class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.isEmpty { return [newInterval] }
        
        var newInterval = newInterval
        var results = [[Int]]()
        
        for i in 0..<intervals.count {
            if intervals[i][0] > newInterval[1] {
                results.append(newInterval)
                results.append(contentsOf: Array(intervals[i..<intervals.count]))
                return results
            } else if intervals[i][1] < newInterval[0] {
                results.append(intervals[i])
            } else {
                let minVal = min(intervals[i][0], newInterval[0])
                let maxVal = max(intervals[i][1], newInterval[1])
                newInterval = [minVal, maxVal]
            }
        }
        results.append(newInterval)
        return results
    }
}


var intervals = [[1,3],[6,9]], newInterval = [2,5]
Solution().insert(intervals, newInterval)
// Output: [[1,5],[6,9]]

intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
newInterval = [4,8]
Solution().insert(intervals, newInterval)
// Output: [[1,2],[3,10],[12,16]]

intervals = []
newInterval = [5,7]
Solution().insert(intervals, newInterval)
// Output: [[5,7]]

intervals = [[1,5]]
newInterval = [2,3]
Solution().insert(intervals, newInterval)
// Output: [[1,5]]

intervals = [[1,5]]
newInterval = [2,7]
Solution().insert(intervals, newInterval)
// Output: [[1,7]]
