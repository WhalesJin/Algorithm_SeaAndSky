// 첫째 줄에는 회장 후보의 점수와 후보의 수를, 두 번째 줄에는 회장 후보를 오름차순으로 모두 출력.
// 친구 관계 가까울수록 점수 낮음

func 회장뽑기() {
    let n = Int(readLine()!)! // 회원 수
    var graph = [[Int]](repeating: [], count: n+1)
    var one = 0, two = 0
    
    while true {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        one = input[0]
        two = input[1]
        
        if one == -1 {
            break
        }
        
        graph[one].append(two)
        graph[two].append(one)
    }
    
    // graph = [[], [2], [1, 3, 4], [2, 4, 5], [3, 5, 2], [4, 3]]
    var scores = [Int](repeating: Int.max, count: n+1)
    
    func bfs(_ start: Int) {
        var queue = [(Int, Int)]() // (친구, 점수)
        
        for i in graph[start] {
            queue.append((i, 1))
        }
        
        var visited = [Bool](repeating: false, count: n+1)
        visited[0] = true
        visited[start] = true
        var friends = [Int](repeating: 0, count: n+1)
        
        while !queue.isEmpty {
            let (person, score) = queue.removeFirst()
            
            if !visited[person] {
                visited[person] = true
                friends[person] = score
                
                for i in graph[person] {
                    queue.append((i, score+1))
                }
            }
        }
        scores[start] = friends.max()!
    }
    
    for i in 1...n {
        bfs(i)
    }
    
    let minScore = scores.min()!
    var leaders = [Int]()
    var count = 0
    
    for i in 1...n {
        if scores[i] == minScore {
            leaders.append(i)
            count += 1
        }
    }
    
    print("\(minScore) \(count)")
    print(leaders.map { String($0) }.joined(separator: " "))
}
