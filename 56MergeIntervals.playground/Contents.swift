class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty { return [[]] }
        
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var results = [intervals.first!]
        
        for i in 1..<intervals.count {
            let prevStart = results.last![0]
            let prevEnd = results.last![1]
            let currentStart = intervals[i][0]
            let currentEnd = intervals[i][1]
            
            if prevEnd >= currentStart && prevEnd < currentEnd {
                results.removeLast()
                results.append([prevStart, currentEnd])
            } else if prevEnd < currentStart {
                results.append([currentStart, currentEnd])
            }
            
        }
        
        return results
    }
}

var intervals = [[1,3],[2,6],[8,10],[15,18]]

//Solution().merge(intervals)
//// Output: [[1,6],[8,10],[15,18]]
//
//intervals = [[1,4],[1,4]]
//Solution().merge(intervals)
//// Output: [[1, 4]]
//
//intervals = [[1,4],[0,4]]
//Solution().merge(intervals)
//// Output: [[0, 4]]
//
//intervals = [[1,4],[0,4]]
//Solution().merge(intervals)
//// Output: [[0, 4]]
//
//intervals = [[2,3],[4,5],[6,7],[1,10], [8,9]]
//Solution().merge(intervals)
//// Output: [[1,10]]
//
//intervals = [[0,1],[4,5],[0,2],[3,4],[2,4],[0,0],[3,5],[0,1],[0,0],[5,5]]
//Solution().merge(intervals)
//// Output: [[0,5]]

intervals = [[1,4],[0,5]]
Solution().merge(intervals)
// Output: [[0, 5]]



