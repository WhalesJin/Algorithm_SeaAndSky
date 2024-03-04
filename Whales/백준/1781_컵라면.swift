// 데드라인과 컵라면의 개수가 정해진 n개의 문제. 동호가 받을 수 있는 최대 컵라면의 수를 구하시오.
// 문제를 푸는데는 단위 시간 1이 걸리며, 각 문제의 데드라인은 n 이하의 자연수이다.

func 컵라면() {
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
            
            while heap[parentIndex] > heap[insertIndex] {
                if insertIndex < 1 {
                    break
                }
                
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
                parentIndex = (insertIndex - 1) / 2
            }
        }
        
        mutating func pop() -> Int? {
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
                    if heap[nodeIndex] > heap[leftChildIndex] {
                        heap.swapAt(nodeIndex, leftChildIndex)
                    }
                    break
                }
                
                if heap[nodeIndex] > heap[leftChildIndex], heap[nodeIndex] > heap[rightChildIndex] {
                    if heap[leftChildIndex] < heap[rightChildIndex] {
                        heap.swapAt(nodeIndex, leftChildIndex)
                        nodeIndex = leftChildIndex
                    } else {
                        heap.swapAt(nodeIndex, rightChildIndex)
                        nodeIndex = rightChildIndex
                    }
                } else if heap[nodeIndex] > heap[leftChildIndex] {
                    heap.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else if heap[nodeIndex] > heap[rightChildIndex] {
                    heap.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                } else {
                    break
                }
            }
            return rootData.1
        }
    }
    
    struct PriorityQueue {
        var queue: Array<Int> = []
        
        mutating func insert(_ data: Int) {
            if queue.isEmpty {
                queue.append(data)
                return
            }
            
            queue.append(data)
            
            var insertIndex = queue.count - 1
            var parentIndex = (insertIndex - 1) / 2
            
            while queue[parentIndex] > queue[insertIndex] {
                if insertIndex < 1 {
                    break
                }
                
                queue.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
                parentIndex = (insertIndex - 1) / 2
            }
        }
        
        mutating func pop() -> Int? {
            if queue.count < 1 { return nil }
            
            queue.swapAt(0, queue.count - 1)
            let rootData = queue.removeLast()
            
            var nodeIndex = 0
            
            while true {
                let leftChildIndex = nodeIndex * 2 + 1
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= queue.count {
                    break
                }
                
                if rightChildIndex >= queue.count {
                    if queue[nodeIndex] > queue[leftChildIndex] {
                        queue.swapAt(nodeIndex, leftChildIndex)
                    }
                    break
                }
                
                if queue[nodeIndex] > queue[leftChildIndex], queue[nodeIndex] > queue[rightChildIndex] {
                    if queue[leftChildIndex] < queue[rightChildIndex] {
                        queue.swapAt(nodeIndex, leftChildIndex)
                        nodeIndex = leftChildIndex
                    } else {
                        queue.swapAt(nodeIndex, rightChildIndex)
                        nodeIndex = rightChildIndex
                    }
                } else if queue[nodeIndex] > queue[leftChildIndex] {
                    queue.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else if queue[nodeIndex] > queue[rightChildIndex] {
                    queue.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                } else {
                    break
                }
            }
            return rootData
        }
    }
    
    let n = Int(readLine()!)!
    var minHeap = MinHeap()
    
    for _ in 1...n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        minHeap.insert((input[0], input[1]))
    }
    
    var count = 0
    var priorityQueue = PriorityQueue()
    var i = 1
    
    while true {
        if minHeap.heap.isEmpty {
            break
        }
        
        if minHeap.heap[0].0 >= i {
            priorityQueue.insert(minHeap.heap[0].1)
            count += minHeap.pop() ?? 0
            
            i += 1
            continue
        }
        
        count -= priorityQueue.pop() ?? 0
        priorityQueue.insert(minHeap.heap[0].1)
        count += minHeap.pop() ?? 0
    }
    
    print(count)
}
