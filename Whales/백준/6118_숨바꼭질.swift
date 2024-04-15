// 1부터 제일 먼 헛간번호, 거리, 같은 거리 개수
// BFS
func 숨바꼭질() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1]
    var list = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Int](repeating: 0, count: n+1)
    
    for _ in 1...m {
        let places = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = places[0], b = places[1]
        list[a].append(b)
        list[b].append(a)
    }
    // list = [[], [3, 2], [3, 1, 4, 5], [6, 4, 2, 1], [3, 2], [2], [3]]
    list = list.map { $0.sorted() }
    
    func bfs() {
        var queue = [(Int, Int)]()
        queue.append((1, 0))
        visited[1] = 1
        
        while !queue.isEmpty {
            let (now, dist) = queue.removeFirst()
            
            for next in list[now] {
                if visited[next] == 0 {
                    visited[next] = dist + 1
                    queue.append((next, dist + 1))
                }
            }
        }
    }
    
    bfs()
  
    var max = 0
    var minNum = 0
    var count = 0

    for i in 2...n {
        let distance = visited[i] // distance로 수정했더니 200->184로 시간 단축
        
        if distance > max {
            max = distance
            minNum = i
        }
    }
    
    for i in 2...n {
        if visited[i] == max {
            count += 1
        }
    }
    
    print("\(minNum) \(max) \(count)")
}
