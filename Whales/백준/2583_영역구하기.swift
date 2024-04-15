// 색칠 안 된 영역의 개수와 넓이(오름차순) 출력
// bfs

func 영역구하기() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = input[0], n = input[1], k = input[2]
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    
    for _ in 1...k {
        let positions = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (a, b) = (positions[0], positions[1]), (c, d) = (positions[2], positions[3])
        // 직사각형 성립 조건 a < c, b < d
        for i in a..<c {
            for j in b..<d {
              /*  if graph[j][i] == 0 {*/ // 나중에 if문 안 쓸 때 시간이랑 메모리 비교해보자 -> 똑같네
                    graph[j][i] = 1
//                }
            }
        }
    }
//    graph = [[0, 0, 0, 0, 1, 1, 0],
//             [0, 1, 0, 0, 1, 1, 0],
//             [1, 1, 1, 1, 0, 0, 0],
//             [1, 1, 1, 1, 0, 0, 0],
//             [0, 1, 0, 0, 0, 0, 0]]
    // 0이 연결된 개수를 어떻게 셀래? -> queue에서 count를 빼자
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    var counts = [(Int, Int, Int)]()

    func bfs(_ row: Int, _ column: Int) -> Int {
        var queue = [(row, column)]
        var count = 1
        visited[row][column] = true
        
        while !queue.isEmpty {
            let (row, column) = queue.removeFirst()
            
            if graph[row][column] == 0 {
                checkNext(row, column + 1)
                checkNext(row, column - 1)
                checkNext(row + 1, column)
                checkNext(row - 1, column)
            }
        }
        
        func checkNext(_ row: Int, _ column: Int) {
            guard row >= 0, row < m, column >= 0, column < n else { return }
            if visited[row][column] == false, graph[row][column] == 0 {
                visited[row][column] = true
                queue.append((row, column))
                count += 1
            }
        }
        
        return count
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if visited[i][j] == false, graph[i][j] == 0 {
                counts.append((i, j, bfs(i, j)))
            }
        }
    }
    
    let answer = counts.sorted { $0.2 < $1.2 }.map { String($0.2) }
    
    print(answer.count)
    print(answer.joined(separator: " "))
}
