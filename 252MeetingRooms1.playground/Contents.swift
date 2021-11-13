class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        for i in 1..<intervals.count {
            let prevEnd = intervals[i-1][0]
            let currStart = intervals[i][1]
            if prevEnd > currStart {
                return false
            }
        }
        return true
    }
}


var intervals = [[0, 30], [5, 10], [15, 20]]
Solution().canAttendMeetings(intervals)
// Output: false

intervals = [[7, 10], [2, 4]]
Solution().canAttendMeetings(intervals)
// Output: true
