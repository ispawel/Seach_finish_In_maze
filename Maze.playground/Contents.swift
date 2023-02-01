import Foundation

var maze = [
// X 0  1  2  3  4  5  6  7  8  9 10  11 12 13 14 15 16 17
    [1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 0
    [1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 1
    [1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 2
    [1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 3
    [1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 4 Y
    [1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], // 5
    [1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1], // 6
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], // 7
    [1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1], // 8
    [1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1], // 9
    [1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1], // 10
    [1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1], // 11
    [1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1], // 12
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1], // 13
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1], // 14
]

var start: (y: Int, x: Int)?
var end: (y: Int, x: Int)?

func seachStart(maze: [[Int]]){
    for y in 0..<maze.count {
        for x in 0..<maze[y].count where start == nil || end == nil {
            
            if (y == 0 || x == 0) && (maze[y][x] == 0) {
                if start == nil {
                    start = (y,x)
                } else {
                    end = (y,x)
                }
            }
            
            if (y == maze.count - 1 || x == maze[y].count - 1) && (maze[y][x] == 0) {
                if start == nil {
                    start = (y,x)
                } else {
                    end = (y,x)
                }
            }
        }
    }
}

seachStart(maze: maze)
start
end

func seachExit(start: (y: Int, x: Int), end: (y: Int, x: Int)) {
    
    stepTo(y: start.y, x: start.x)
    
    func stepTo(y: Int, x: Int) -> Bool {
        
        // точка пройдена
        maze[y][x] = 7
        
        if (y, x) == end {
            // print("Finish !!!")
            return true
        }
        
        //up
        if y > 0 && maze[y - 1][x] == 0 {
            // print("Up")
            if stepTo(y: y - 1, x: x) {
                return true
            }
        }
        
        //right
        if x < maze[y].count && maze[y][x + 1] == 0 {
            // print("right")
            if stepTo(y: y, x: x + 1) {
                return true
            }
        }
        
        //left
        if x > 0 && maze[y][x - 1] == 0 {
            // print("Left")
            if stepTo(y: y, x: x - 1) {
                return true
            }
        }
        
        //down
        if y < maze.count && maze[y + 1][x] == 0 {
            // print("Down")
            if stepTo(y: y + 1, x: x) {
                return true
            }
        }
        
        // Пометил тупик
        maze[y][x] = 5
        return false
    }
    
}

seachExit(start: start!, end: end!)
print("")
maze.map{ print($0) }
