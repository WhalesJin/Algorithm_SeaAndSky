// 한나가 배추를 재배하는 땅은 고르지 못해서 배추를 군데군데 심어 놓았다. 배추들이 모여있는 곳에는 배추흰지렁이가 한 마리가 필요할 때, 총 몇 마리의 지렁이가 필요한지 구하시오.

func 유기농배추1012() {
    let t = Int(readLine()!)!
    
    for _ in 1...t {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let m = input[0], n = input[1], k = input[2] // 가로, 세로, 배추 개수
        var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        
        for _ in 1...k {
            let position = readLine()!.split(separator: " ").compactMap { Int($0) }
            let x = position[0], y = position[1]
            graph[y][x] = 1
        }
        
        print(CountWarm())
        
        func isValid(_ a: Int, _ b: Int) -> Bool {
            return 0..<n ~= a && 0..<m ~= b
        }
        
        func CountWarm() -> Int {
            var count = 0
            
            for i in 0..<n {
                for j in 0..<m {
                    if graph[i][j] == 1 {
                        bfs(i, j)
                        count += 1
                    }
                }
            }
            
            return count
        }
        
        func bfs(_ row: Int, _ column: Int) {
            var queue = [(row, column)]
            let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
            
            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()
                
                for i in 0..<4 {
                    let nx = x + dx[i], ny = y + dy[i]
                    
                    guard isValid(nx, ny) else { continue }
                    
                    if graph[nx][ny] == 1 {
                        graph[nx][ny] = 0
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
}

// 예전 코드
func 유기농배추() {
    let testCount: Int = Int(readLine()!)!
    // 동 남 서 북
//    let dx: [Int] = [1, 0, -1, 0]
//    let dy: [Int] = [0, 1, 0, -1]
    for _ in 1...testCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0], y = input[1], k = input[2]
        var graph = [[Int]](repeating: [Int](repeating: 0, count: x), count: y)
        // graph = []
        
        // 배추개수만큼 입력받기
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let a = input[0], b = input[1]
            // (x, y) = (a, b)
            graph[b][a] = 1
        }
        //       0    1    2    3    4    5    6    7    8    9
        
        //  0    1    1    0    0    0    0    0    0    0    0
        //  1    0    1    0    0    0    0    0    0    0    0
        //  2    0    0    0    0    1    0    0    0    0    0
        //  3    0    0    0    0    1    0    0    0    0    0
        //  4    0    0    1    1    0    0    0    1    1    1
        //  5    0    0    0    0    1    0    0    1    1    1
        //  6    0    0    0    0    0    0    0    1    1    1
        //  7    0    0    0    0    0    0    0    0    0    0
        
        func isValid(_ a: Int, _ b: Int) -> Bool {
            return 0..<x ~= a && 0..<y ~= b
        }
        
        func dfs(_ a: Int, _ b: Int) {
            guard isValid(a, b) else { return }
            
            if graph[b][a] == 1 {
                graph[b][a] = 0
                dfs(a+1, b)
                dfs(a-1, b)
                dfs(a, b+1)
                dfs(a, b-1)
            }
        }
        
        var count: Int = 0
        
        for i in 0..<y {
            for j in 0..<x {
                if graph[i][j] == 1 {
                    dfs(j, i)
                    count += 1
                }
            }
        }
        
        print(count)
    }
}
