// (1, 1)부터 (n, m)까지 최단거리

// 수정 후
func 미로탐색() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1]
    var graph = [[Character]]()
    
    for _ in 1...n {
        graph.append(Array(readLine()!))
    }

    var counts = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    func bfs(_ row: Int, _ column: Int) {
        var queue = [(row, column)] // (row, column, count)
        counts[row][column] = 1
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        while !queue.isEmpty {
            let (row, column) = queue.removeFirst()
            
            if graph[row][column] == "1" {
                for i in 0..<4 {
                    let x = row + dx[i], y = column + dy[i]
                    
                    if x >= 0, x < n, y >= 0, y < m, counts[x][y] == 0, graph[x][y] == "1" {
                        queue.append((x, y))
                        counts[x][y] = counts[row][column] + 1
                    }
                }
            }
        }
    }
    
    bfs(0, 0)
    print(counts[n-1][m-1])
}

//    1. 시작하는 칸을 queue에 넣고 방문했다는 표시(점)을 남김
//    2. queue에서 원소를 꺼내어 그 칸에 상하좌우로 인접한 칸에 대해 3번을 진행
//    3. 해당 칸을 이전에 방문했다면 아무것도 하지 않고, 처음으로 방문했다면 방문했다는 표시를 남기고 해당 칸을 queue에 삽입
//    4. queue가 빌 때까지 2번 반복

// 수정 전 - 성공
func 미로탐색() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1]
    var graph = [[Character]]()
    
    for _ in 1...n {
        graph.append(Array(readLine()!))
    }
//    graph = [["1", "0", "1", "1", "1", "1"],
//             ["1", "0", "1", "0", "1", "0"],
//             ["1", "0", "1", "0", "1", "1"],
//             ["1", "1", "1", "0", "1", "1"]]
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var counts = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var queue = [(0, 0, 1)] // (row, column, count)
    
    visited[0][0] = true
    counts[0][0] = 1
    
    while !queue.isEmpty {
        let (row, column, count) = queue.removeFirst()
        
        if graph[row][column] == "1" {
            bfs(row, column + 1, count + 1)
            bfs(row, column - 1, count + 1)
            bfs(row + 1, column, count + 1)
            bfs(row - 1, column, count + 1)
        }
    }
        
    func bfs(_ row: Int, _ column: Int, _ count: Int) {
        guard row >= 0, row < n, column >= 0, column < m else { return }
        if visited[row][column] == false, graph[row][column] == "1" {
            visited[row][column] = true
            queue.append((row, column, count))
            counts[row][column] = count
        }
    }
    
    bfs(0, 0, 1)
    print(counts[n-1][m-1])
}
