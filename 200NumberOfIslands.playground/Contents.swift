class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }
        
        var grid = grid
        var noOfIslands = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    noOfIslands += count(&grid, i, j)
                }
            }
        }
        return noOfIslands
    }
    
    private func count(_ grid: inout [[Character]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count { return 0 }
        
        if grid[i][j] == "0" { return 0 }
        
        grid[i][j] = "0"
        
        count(&grid, i-1, j)
        count(&grid, i+1, j)
        count(&grid, i, j-1)
        count(&grid, i, j+1)
        
        return 1
    }
}

var grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","1"]
]

var charGrid = grid.map { $0.map { Character($0) } }
Solution().numIslands(charGrid)
// Output: 1


