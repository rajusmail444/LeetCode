import UIKit

/*
 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

 Example 1:
 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 
 Example 2:
 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 
 Example 3:
 Input: temperatures = [30,60,90]
 Output: [1,1,0]
  
 Constraints:
 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100
*/

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        if temperatures.isEmpty { return [] }
        var days = Array(repeating: 0, count: temperatures.count)
        var indexes = [Int]()
        for (index, temperature) in temperatures.enumerated() {
            while !indexes.isEmpty && temperatures[indexes.last!] < temperature {
                let prevIndex = indexes.removeLast()
                print("index: \(index)")
                print("prevIndex: \(prevIndex)")
                let diff = index - prevIndex
                days[prevIndex] = diff
            }
            print("indexOut: \(index)")
            indexes.append(index)
        }
        return days
    }
}

class MySolution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        if temperatures.isEmpty { return [] }
        var days = Array(repeating: 0, count: temperatures.count)
        for i in 1..<temperatures.count {
            var noOfDays = 0
            print("i: \(i)")
            if temperatures[i] <= temperatures[i-1] {
                var j = i
                while j < temperatures.count && temperatures[j] <= temperatures[i-1] {
                    noOfDays += 1
                    j += 1
                    print("j: \(j)")
                }
                j >= temperatures.count ? (noOfDays = 0) : (noOfDays += 1)
            } else {
                noOfDays += 1
            }
            days[i-1] = noOfDays
        }
        return days
    }
}

//print(Solution().dailyTemperatures([89,62,70,58,47,47,46,76,100,70])) // [8,1,5,4,3,2,1,1,0,0]
print(Solution().dailyTemperatures([73,74,75,71,69,72,76,73])) // [1,1,4,2,1,1,0,0]
//print(Solution().dailyTemperatures([30,40,50,60])) // [1,1,1,0]
//print(Solution().dailyTemperatures([30,60,90])) // [1,1,0]
