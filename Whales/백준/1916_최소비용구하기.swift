// n(1 <= n <= 1000)개의 도시, m(1 <= m <= 100,000)개의 버스
// 출발 도시, 도착 도시, 비용(0 < 비용 < 100,000)

// heap -> 오 17% 까진 올라가네

func 최소비용구하기() {
    struct MinHeap {
        var heap: Array<(Int, Int)> = []
        
        mutating func insert(_ data: (Int, Int)) {
            if heap.isEmpty {
                heap.append(data)
                return
            }
            
            heap.append(data)
            
            var insertIndex = heap.count - 1
            var parentIndex = (insertIndex - 1) / 2
            
            while heap[parentIndex].1 > heap[insertIndex].1 {
                if insertIndex < 1 {
                    break
                }
                
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
                parentIndex = (insertIndex - 1) / 2
            }
        }
        
        mutating func pop() -> (Int, Int)? {
            if heap.count < 1 { return nil }
            
            heap.swapAt(0, heap.count - 1)
            let rootData = heap.removeLast()
            
            var nodeIndex = 0
            
            while true {
                let leftChildIndex = nodeIndex * 2 + 1
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= heap.count {
                    break
                }
                
                if rightChildIndex >= heap.count {
                    if heap[nodeIndex].1 > heap[leftChildIndex].1 {
                        heap.swapAt(nodeIndex, leftChildIndex)
                    }
                    break
                }
                
                if heap[nodeIndex].1 > heap[leftChildIndex].1, heap[nodeIndex].1 > heap[rightChildIndex].1 {
                    if heap[leftChildIndex].1 < heap[rightChildIndex].1 {
                        heap.swapAt(nodeIndex, leftChildIndex)
                        nodeIndex = leftChildIndex
                    } else {
                        heap.swapAt(nodeIndex, rightChildIndex)
                        nodeIndex = rightChildIndex
                    }
                } else if heap[nodeIndex].1 > heap[leftChildIndex].1 {
                    heap.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else if heap[nodeIndex].1 > heap[rightChildIndex].1 {
                    heap.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                } else {
                    break
                }
            }
            return rootData
        }
    }
    
    let n = Int(readLine()!)!, m = Int(readLine()!)!
    var graph = [MinHeap](repeating: MinHeap(), count: n+1)
    
    for _ in 1...m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let st = input[0], en = input[1], cost = input[2]
        
        if st == en {
            continue
        }
        
        graph[st].insert((en, cost))
    }
    // graph = [[], [(4, 1), (2, 2), (3, 3), (5, 10)], [(4, 2)], [(4, 1), (5, 1)], [(5, 3)], []]
    
    var costs = [Int](repeating: Int.max, count: n+1)
    
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let start = input[0], end = input[1]
    
    costs[start] = 0
    
    bfs()
    
    func bfs() {
        var queue = graph[start]
        var visited = [Bool](repeating: false, count: n+1)
        visited[start] = true
        
        while !queue.heap.isEmpty {
            let (city, cost) = queue.pop()!

            if !visited[city] {
                visited[city] = true
                costs[city] = cost
            }
            
            if city == end {
                continue
            }
            
//            for (next, nextCost) in graph[city].heap {
//                if !visited[next] {
//                    queue.insert((next, nextCost + cost))
//                }
//            }
          
            while !graph[city].heap.isEmpty { // 와, 이걸로 바꿨더니 됐다... 이거 꼭 다시 보자
                let (next, nextCost) = graph[city].pop()!
                
                if !visited[next] {
                    queue.insert((next, nextCost + cost))
                }
            }
        }
    }
    
    print(costs[end])
}
