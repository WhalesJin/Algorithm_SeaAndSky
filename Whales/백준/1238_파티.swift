// n(1 <= n <= 1000)개의 마을에 학생 한 명씩
// x번 마을에서 파티 할 때, "오고 가는데" 제일 오래 이동하는 학생은? (각자 최단 거리로 움직임)
// 이동 정보 m(1 <= m <= 10000)개 -> 시작, 끝, 소요시간 (시작 != 끝, 1 <= 시간 <= 100, a에서 b로 가는 도로 수 최대 하나)

// 확실히 heap을 쓰는 게 시간이 적게 걸린다.

// 그냥 bfs 70052KB, 188ms
func 파티() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1], x = input[2]
    var comingGraph = [[(Int, Int)]](repeating: [], count: n+1) // graph[도착] = [(출발, 시간)]
    var goingGraph = [[(Int, Int)]](repeating: [], count: n+1) // graph[출발] = [(도착, 시간)]
    
    for _ in 1...m {
        let info = readLine()!.split(separator: " ").compactMap { Int($0) }
        // 거꾸로 가자
        comingGraph[info[1]].append((info[0], info[2]))
        goingGraph[info[0]].append((info[1], info[2]))
    }
    
    var times = [Int](repeating: Int.max, count: n+1)
    times[x] = 0
    times[0] = 0
    var comingTimes = times
    var goingTimes = times
    
    bfs(end: x)
    bfs(start: x)
    
    for i in 1...n {
        times[i] = comingTimes[i] + goingTimes[i]
    }
    
    print(times.max()!)
    
    
    func bfs(end: Int) {
        var queue = comingGraph[end]
        
        while !queue.isEmpty {
            let (start, time) = queue.removeFirst()

            
            if comingTimes[start] > time {
                comingTimes[start] = time
                
                
                for (prev, prevTime) in comingGraph[start] {
                    if start == end {
                        continue
                    }

                    queue.append((prev, prevTime + time))
                }
            }
        }
    }
    
    func bfs(start: Int) {
        var queue = goingGraph[start]
        
        while !queue.isEmpty {
            let (end, time) = queue.removeFirst()

            
            if goingTimes[end] > time {
                goingTimes[end] = time
                
                
                for (next, nextTime) in goingGraph[end] {
                    if end == start {
                        continue
                    }

                    queue.append((next, nextTime + time))
                }
            }
        }
    }
}

// heap. 69764KB, 24ms
func 파티() {
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
    
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0], m = input[1], x = input[2]
    var comingGraph = [MinHeap](repeating: MinHeap(), count: n+1) // graph[도착] = [(출발, 시간)]
    var goingGraph = [MinHeap](repeating: MinHeap(), count: n+1) // graph[출발] = [(도착, 시간)]
    
    for _ in 1...m {
        let info = readLine()!.split(separator: " ").compactMap { Int($0) }
        // 거꾸로 가자
        comingGraph[info[1]].insert((info[0], info[2]))
        goingGraph[info[0]].insert((info[1], info[2]))
    }
    
    var times = [Int](repeating: Int.max, count: n+1)
    times[x] = 0
    times[0] = 0
    var comingTimes = times
    var goingTimes = times
    
    bfs(end: x)
    bfs(start: x)
    
    for i in 1...n {
        times[i] = comingTimes[i] + goingTimes[i]
    }
    
    print(times.max()!)
    
    
    func bfs(end: Int) {
        var queue = comingGraph[end]
        
        while !queue.heap.isEmpty {
            let (start, time) = queue.pop()!

            
            if comingTimes[start] > time {
                comingTimes[start] = time
                
                
                for (prev, prevTime) in comingGraph[start].heap {
                    if start == end {
                        continue
                    }

                    queue.insert((prev, prevTime + time))
                }
            }
        }
    }
    
    func bfs(start: Int) {
        var queue = goingGraph[start]
        
        while !queue.heap.isEmpty {
            let (end, time) = queue.pop()!

            
            if goingTimes[end] > time {
                goingTimes[end] = time
                
                
                for (next, nextTime) in goingGraph[end].heap {
                    if end == start {
                        continue
                    }

                    queue.insert((next, nextTime + time))
                }
            }
        }
    }
}


