// 메모리 69784KB, 시간 280ms

func 나이트의이동7562() {
    let t = Int(readLine()!)!
    
    for _ in 1...t {
        let n = Int(readLine()!)!
        var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        let start = readLine()!.split(separator: " ").compactMap { Int($0) }
        let end = readLine()!.split(separator: " ").compactMap { Int($0) }
        let startX = start[0], startY = start[1]
        let endX = end[0], endY = end[1]
        
        bfs(startX, startY)
        
        print(graph[endX][endY])
        
        func isValid(_ a: Int, _ b: Int) -> Bool {
            return 0..<n ~= a && 0..<n ~= b
        }
        
        func bfs(_ row: Int, _ column: Int) {
            var queue = [(row, column)]
            let dx = [-2, -1, 1, 2, -2, -1, 1, 2], dy = [-1, -2, -2, -1, 1, 2, 2, 1]
            
            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()
                let count = graph[x][y]
                
                if x == endX, y == endY {
                    break
                }
                
                for i in 0..<8 {
                    let nx = x + dx[i], ny = y + dy[i]
                    
                    guard isValid(nx, ny) else { continue }
                    
                    if nx == startX && ny == startY {
                        continue
                    }
                    
                    if graph[nx][ny] == 0 {
                        graph[nx][ny] = count + 1
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
}

// 메모리 85680KB, 시간 84ms
func 나이트의이동() {
    let dx = [-2, -1, +1, +2, -2, -1, +1, +2]
    let dy = [-1, -2, -2, -1, +1, +2, +2, +1]
    
    func isValid(_ x: Int, _ y: Int, _ l: Int) -> Bool {
        return 0..<l ~= x && 0..<l ~= y
    }
    
    let testCount: Int = Int(readLine()!)!
    
    for _ in 0..<testCount {
        let l: Int = Int(readLine()!)! // 한 변의 길이
        let start: [Int] = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        let end: [Int] = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        let startPointX: Int = start[0], startPointY: Int = start[1]
        let endPointX: Int = end[0], endPointY: Int = end[1]
        var board = [[Bool]](repeating: [Bool](repeating: false, count: l), count: l)
        
        func move(_ x: Int, _ y: Int) {
            var queue = [(x, y, 0)]
            var index = 0
            board[y][x] = true
            
            while queue.count > index {
                let x = queue[index].0
                let y = queue[index].1
                let d = queue[index].2
                
                if x == endPointX && y == endPointY {
                    print(d)
                    break
                }
                
                for i in 0..<8 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if isValid(nx, ny, l) && board[ny][nx] == false {
                        board[ny][nx] = true
                        queue.append((nx, ny, d + 1))
                    }
                }
                
                index += 1
            }
        }
        
        move(startPointX, startPointY)
    }
}
