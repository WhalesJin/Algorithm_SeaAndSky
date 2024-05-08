// *: 주난, #: 범인, 점프하면 0 상하좌우의 1이 0으로 바뀜. 범인을 쓰러뜨릴 때까지 점프 횟수
// 결국 *부터 #까지 1의 개수 + 1

func 주난의난() {
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
    
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1]
    let position = readLine()!.split(separator: " ").compactMap { Int($0) }
    let x1 = position[0]-1, y1 = position[1]-1, x2 = position[2]-1, y2 = position[3]-1
    var classroom = [[String]]()
    
    for _ in 1...n {
        classroom.append(readLine()!.map { String($0) })
    }
    
    var jumps = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
    
    bfs()
    print(jumps[x2][y2])
    
    func bfs() {
        var queue = MinHeap()
        queue.insert((x1, y1, 0))
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        let dx = [-1, 0, 1, 0], dy = [0, -1, 0, 1]
        
        while !queue.heap.isEmpty {
            let (x, y, jump) = queue.pop()!
            visited[x][y] = true
            
            if jumps[x][y] <= jump {
                continue
            }
            
            jumps[x][y] = jump
            
            if x == x2 && y == y2 {
                continue
            }
            
            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                
                if (0..<n ~= nx && 0..<m ~= ny) == false {
                    continue
                }
                
                if !visited[nx][ny] {
                    let value = classroom[nx][ny] == "#" ? 1 : Int(classroom[nx][ny])!
                    
                    queue.insert((nx, ny, jump + value))
                }
            }
        }
    }
}
