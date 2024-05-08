// 미로 n * m, 상하좌우 이동, 0: 빈방, 1: 벽, (1,1)부터 (n,m)까지 벽 최소 몇 개? 시작과 끝은 뚫려있음

func 알고스팟() {
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
    // false면서 0이면 그 쪽으로 가자
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = input[0], n = input[1] // n이 row
    var maze = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let max = Int.max
    var breakCounts = [[Int]](repeating: [Int](repeating: max, count: m), count: n)
    
    for _ in 1...n {
        maze.append(readLine()!.compactMap { Int(String($0)) })
    }
    
    bfs()
    print(breakCounts[n-1][m-1])
    
    func isValid(_ row: Int, _ column: Int) -> Bool {
        return 0..<n ~= row && 0..<m ~= column
    }
    
    func bfs() {
        var queue = MinHeap()
        queue.insert((0, 0, 0))
        let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]

        while !queue.heap.isEmpty {
            let (x, y, count) = queue.pop()!
            visited[x][y] = true

            if breakCounts[x][y] <= count {
                continue
            }

            breakCounts[x][y] = count

            if x == n-1 && y == m-1 {
                continue
            }

            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]

                if !isValid(nx, ny) || visited[nx][ny] {
                    continue
                }

                if maze[nx][ny] == 0 {
                    queue.insert((nx, ny, count))
                } else {
                    queue.insert((nx, ny, count+1))
                }
            }
        }
    }
}
