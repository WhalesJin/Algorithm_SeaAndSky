func 뿌요뿌요() {
    var field = [[Character]](repeating: [".", ".", ".", ".", ".", "."], count: 12)
    
    for i in 0..<12 {
        field[i] = readLine()!.map { $0 }
        // RGBPY
    }
    
    var count = 0
    var bombIndexes = [(Int, Int)]()

    while true {
        for i in 0..<12 {
            for j in 0..<6 {
                if field[i][j] == "." {
                    continue
                } else {
                    bfs(i, j)
                }
            }
        }
        
        if bombIndexes.isEmpty {
            break
        }
        
        bomb()
        
        for j in 0..<6 {
            var puyos = [Character]()
            
            for i in 0..<12 {
                if field[i][j] != "." {
                    puyos.append(field[i][j])
                }
            }
            
            if puyos.isEmpty {
                continue
            }
            
            for i in stride(from: 11, through: 0, by: -1) {
                if !puyos.isEmpty {
                    field[i][j] = puyos.removeLast()
                } else {
                    field[i][j] = "."
                }
            }
        }
        
//        for i in 0..<12 {
//            print(field[i].map{String($0)}.joined())
//        }
    }
    
    print(count)
    
    func bomb() {
        bombIndexes = bombIndexes.sorted(by: { $0.0 < $1.0 })
        
        for (x, y) in bombIndexes {
            field[x][y] = "."
        }
        
        bombIndexes = [(Int, Int)]()
        count += 1
    }
    
    func bfs(_ row: Int, _ column: Int) {
        var queue = [(row, column)]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 6), count: 12)
        let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
        var bombIndex = [(Int, Int)]()
        let char = field[row][column]
        var count = 1
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            visited[x][y] = true
            bombIndex.append((x, y))
            
            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                
                if isValid(nx, ny) && !visited[nx][ny] {
                    if field[nx][ny] == char {
                        queue.append((nx, ny))
                        count += 1
                    } else {
                        visited[nx][ny] = true
                    }
                }
            }
        }
        
        if count >= 4 {
            bombIndexes += bombIndex
        }
    }
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return 0..<12 ~= x && 0..<6 ~= y
    }
}
