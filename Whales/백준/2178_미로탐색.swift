// (1, 1)부터 (n, m)까지 최단거리

//    1. 시작하는 칸을 queue에 넣고 방문했다는 표시(점)을 남김
//    2. queue에서 원소를 꺼내어 그 칸에 상하좌우로 인접한 칸에 대해 3번을 진행
//    3. 해당 칸을 이전에 방문했다면 아무것도 하지 않고, 처음으로 방문했다면 방문했다는 표시를 남기고 해당 칸을 queue에 삽입
//    4. queue가 빌 때까지 2번 반복

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
    print(counts)
}
