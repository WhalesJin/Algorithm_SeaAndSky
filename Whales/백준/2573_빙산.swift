// 와 첫번째 풀이가 메모리도 시간도 제일 좋네. dfs bfs 구별만 잘하자!!!

func 빙산() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1]
    var graph = [[Int]]()
    
    for _ in 1...n {
        graph.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }
    
    var melted = graph
    var answer = 0
    var iceberg = 1
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    while iceberg == 1 {
        melt()
        iceberg = CountIceberg()
    }
    
    print(iceberg == 0 ? 0 : answer)
    
    func melt() {
        let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
    
        for i in 0..<n {
            for j in 0..<m {
                if graph[i][j] != 0 {
                    var meltCnt = 0
    
                    for k in 0..<4 {
                        let x = i + dx[k], y = j + dy[k]
    
                        if x < 0, x >= n, y < 0, y >= m {
                            continue
                        }
    
                        if graph[x][y] == 0 {
                            meltCnt += 1
                        }
                    }
    
                    if melted[i][j] > meltCnt {
                        melted[i][j] -= meltCnt
                    } else {
                        melted[i][j] = 0
                    }
                }
            }
        }
    
        answer += 1
        graph = melted
    }
    
    func CountIceberg() -> Int {
        var count = 0
    
        for i in 0..<n {
            for j in 0..<m {
                if graph[i][j] != 0, !visited[i][j] {
                    dfs(i, j)
                    count += 1
                }
            }
        }
    
        visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        return count
    }
    
    func dfs(_ row: Int, _ column: Int) {
        var queue = [(row, column)]
        let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
    
        while !queue.isEmpty {
            let (x, y) = queue.removeLast()
            visited[x][y] = true
    
            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
    
                if nx < 0, nx >= n, ny < 0, ny >= m {
                    continue
                }
    
                if graph[nx][ny] != 0, !visited[nx][ny] {
                    queue.append((nx, ny))
                }
            }
        }
    }
}
