class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty { return false }
        
        let rows = matrix.count
        let columns = matrix[0].count
        
        var start = 0
        var end = rows * columns - 1
        
        while start <= end {
            let mid = start + (end - start)/2
            let midVal = matrix[mid/columns][mid%columns]
            
            if midVal == target { return true }
            
            if midVal > target {
                end = mid - 1
            } else if midVal < target {
                start = mid + 1
            }
        }
        return false
    }
}

var matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
Solution().searchMatrix(matrix, 3)
// Output: true

matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
Solution().searchMatrix(matrix, 13)
// Output: false
