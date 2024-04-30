// https://leetcode.com/problems/network-delay-time/description/

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    // times = [[2,1,1],[2,3,1],[3,4,1]] 단방향, n: 노드 수, k: 시작 노드
    
    var graph = [[(Int, Int)]](repeating: [], count: n+1) // (node, edge)
    // [[], [], [(1, 1), (3, 1)], [(4, 1)], []]
    
    for element in times {
        let st = element[0]
        let en = element[1]
        let edge = element[2]
        
        graph[st].append((en, edge))
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    visited[0] = true
    visited[k] = true
    var timesFromK = [Int](repeating: 0, count: n+1)
    
    bfs()
    
    func bfs() {
        var queue = graph[k]
        
        while !queue.isEmpty {
            let (node, edge) = queue.removeFirst()
            
            if !visited[node] || timesFromK[node] > edge {
                visited[node] = true
                timesFromK[node] = edge
                
                for element in graph[node] {
                    queue.append((element.0, element.1 + edge))
                }
            }
        }
    }
    
    return visited.contains(false) ? -1 : timesFromK.max()!
}
