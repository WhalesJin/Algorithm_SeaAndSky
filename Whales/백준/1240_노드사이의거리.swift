 // N개의 노드로 이루어진 트리가 주어지고 M개의 두 노드 쌍을 입력받을 때 두 노드 사이의 거리를 출력하라.

func 노드사이의거리() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let m = input[1]
    var table = [[(Int, Int)]](repeating: [], count: n+1)
    
    for _ in 1..<n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        table[input[0]].append((input[1], input[2]))
        table[input[1]].append((input[0], input[2]))
    }
  
    // table = [[], [(2, 2), (4, 3)], [(1, 2)], [(4, 2)], [(3, 2), (1, 3)]]
    
    var visited = Array(repeating: 0, count: n+1) // false = 0, true = 1
    var distance: Int = 0
    
    func dfs(start: Int, end: Int, length: Int) {
        visited[start] = 1
        
        if start == end {
            distance = length
        }
        
        for i in table[start] {
            if visited[i.0] == 0 {
                dfs(start: i.0, end: end, length: length + i.1)
            }
        }
    }
    
    for _ in 1...m {
        let nodes = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        visited = Array(repeating: 0, count: n+1)
        distance = 0
        dfs(start: nodes[0], end: nodes[1], length: 0)
        
        print(distance)
    }
}
