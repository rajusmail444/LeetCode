class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        var meetingsStart = [Int]()
        var meetingsEnd = [Int]()
        var meetingRoomsUsed = 0
        
        for i in 0..<intervals.count {
            meetingsStart.append(intervals[i][0])
            meetingsEnd.append(intervals[i][1])
        }
        
        meetingsStart.sort()
        meetingsEnd.sort()
        var sIndex = 0
        var eIndex = 0
        
        while sIndex < intervals.count {
            let startTime = meetingsStart[sIndex]
            let endTime = meetingsEnd[eIndex]
            if startTime >= endTime {
                meetingRoomsUsed -= 1
                eIndex += 1
            }
            sIndex += 1
            meetingRoomsUsed += 1
        }
        
        return meetingRoomsUsed
    }
}

var intervals = [[0, 30], [5, 10], [15, 20]]
Solution().minMeetingRooms(intervals)
// Output: 2

intervals = [[7, 10], [2, 4]]
Solution().minMeetingRooms(intervals)
// Output: 1
