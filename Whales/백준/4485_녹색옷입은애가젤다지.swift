// 루피(rupee)
// 도둑루피 - 소지한 루피 감소
// (0,0)에서 (n-1, n-1)까지 도둑루피 최소금액은?

// MinHeap으로 성공. Heap을 안쓰고 다익스트라를 할 순 없을까?
func 녹색옷입은애가젤다지() {
    struct MinHeap {
        var heap: Array<(Int, Int, Int)> = []
        
        mutating func insert(_ data: (Int, Int, Int)) {
            if heap.isEmpty {
                heap.append(data)
                return
            }
            
            heap.append(data)
            
            var insertIndex = heap.count - 1
            var parentIndex = (insertIndex - 1) / 2
            
            while heap[parentIndex].2 > heap[insertIndex].2 {
                if insertIndex < 1 {
                    break
                }
                
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
                parentIndex = (insertIndex - 1) / 2
            }
        }
        
        mutating func pop() -> (Int, Int, Int)? {
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
                    if heap[nodeIndex].2 > heap[leftChildIndex].2 {
                        heap.swapAt(nodeIndex, leftChildIndex)
                    }
                    break
                }
                
                if heap[nodeIndex].2 > heap[leftChildIndex].2, heap[nodeIndex].2 > heap[rightChildIndex].2 {
                    if heap[leftChildIndex].2 < heap[rightChildIndex].2 {
                        heap.swapAt(nodeIndex, leftChildIndex)
                        nodeIndex = leftChildIndex
                    } else {
                        heap.swapAt(nodeIndex, rightChildIndex)
                        nodeIndex = rightChildIndex
                    }
                } else if heap[nodeIndex].2 > heap[leftChildIndex].2 {
                    heap.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else if heap[nodeIndex].2 > heap[rightChildIndex].2 {
                    heap.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                } else {
                    break
                }
            }
            return rootData
        }
    }
    
    var n = Int(readLine()!)!
    var testCount = 1
    var cave = [[Int]]()
    var rupees = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    
    while n != 0 {
        for _ in 0..<n {
            cave.append(readLine()!.split(separator: " ").compactMap { Int($0) })
        }
        
        dijkstra()
        
        print("Problem \(testCount): \(rupees[n-1][n-1])")
        testCount += 1
        
        n = Int(readLine()!)!
        cave = [[Int]]()
        rupees = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    }
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return 0..<n ~= x && 0..<n ~= y
    }
    
    func dijkstra() {
        var queue = MinHeap()
        queue.insert((0, 0, cave[0][0]))
        let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        
        while !queue.heap.isEmpty {
            let (x, y, count) = queue.pop()!
            visited[x][y] = true
            
            if rupees[x][y] <= count {
                continue
            }
            
            rupees[x][y] = count
            
            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                
                if !isValid(nx, ny) {
                    continue
                }
                
                if !visited[nx][ny] {
                    queue.insert((nx, ny, count + cave[nx][ny]))
                }
            }
        }
    }
}
