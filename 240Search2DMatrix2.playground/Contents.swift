class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty { return false }
        
        var rows = 0
        var columns = matrix[0].count - 1
        
        while rows < matrix.count && columns >= 0 {
            let val = matrix[rows][columns]
            
            if val == target { return true }
            if target < val {
                columns -= 1
            } else {
                rows += 1
            }
        }
        return false
    }
}

var matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
Solution().searchMatrix(matrix, 5)
// Output: true

matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
Solution().searchMatrix(matrix, 20)
// Output: false
