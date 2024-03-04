// 백준이가 정수를 하나씩 외칠때마다 동생은 지금까지 백준이가 말한 수 중에서 중간값을 말해야 한다.
// (짝수개라면 중간에 있는 두 수 중에서 작은 수)

// MinHeap을 두개 만들어서 투포인터로 풀면 되지 않을까? -> Max 하나 Min 하나 해서 풂
// 프린트 시간때문에 여태 시간초과.... 너무해
func 가운데를말해요() {
    struct HeapInt {
        var heap: Array<Int> = []
        var count: Int {
            return heap.count
        }
        private let sortFunction: (Int, Int) -> Bool
        
        init(_ sortFunction: @escaping (Int, Int) -> Bool) {
            self.sortFunction = sortFunction
        }
        
        mutating func insert(_ data: Int) {
            if heap.isEmpty {
                heap.append(data)
                return
            }
            
            heap.append(data)
            
            var insertIndex = heap.count - 1
            var parentIndex = (insertIndex - 1) / 2
            
            while sortFunction(heap[insertIndex], heap[parentIndex]) {
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
                    if sortFunction(heap[leftChildIndex], heap[nodeIndex]) {
                        heap.swapAt(nodeIndex, leftChildIndex)
                    }
                    break
                }
                
                if sortFunction(heap[leftChildIndex], heap[nodeIndex]), sortFunction(heap[rightChildIndex], heap[nodeIndex]) {
                    if sortFunction(heap[leftChildIndex], heap[rightChildIndex]) {
                        heap.swapAt(nodeIndex, leftChildIndex)
                        nodeIndex = leftChildIndex
                    } else {
                        heap.swapAt(nodeIndex, rightChildIndex)
                        nodeIndex = rightChildIndex
                    }
                } else if sortFunction(heap[leftChildIndex], heap[nodeIndex]) {
                    heap.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else if sortFunction(heap[rightChildIndex], heap[nodeIndex]) {
                    heap.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                } else {
                    break
                }
            }
            return rootData
        }
    }
    
    let n = Int(readLine()!)!
    var leftQueue = HeapInt(>)
    var rightQueue = HeapInt(<)
    var center = ""
  
    // 개수: 왼 >= 오
    for _ in 1...n {
        let number = Int(readLine()!)!

        if leftQueue.count == 0 {
            leftQueue.insert(number)
            center += "\(leftQueue.heap[0])\n"
            continue
        }

        if rightQueue.count == 0 {
            if leftQueue.heap[0] <= number {
                rightQueue.insert(number)
            } else {
                rightQueue.insert(leftQueue.pop()!)
                leftQueue.insert(number)
            }
            center += "\(leftQueue.heap[0])\n"
            continue
        }

        let leftMax = leftQueue.heap[0]
        let rightMin = rightQueue.heap[0]

        if leftQueue.count > rightQueue.count { // [a,b,c] [d,e] -> c보다 작을 때만 left
            if number < leftMax {
                rightQueue.insert(leftQueue.pop()!)
                leftQueue.insert(number)
            } else {
                rightQueue.insert(number)
            }
        } else { // [a,b] [c,d]
            if number <= rightMin {
                leftQueue.insert(number)
            } else {
                leftQueue.insert(rightQueue.pop()!)
                rightQueue.insert(number)
            }
        }

        center += "\(leftQueue.heap[0])\n"
    }
    
    print(center)
}
