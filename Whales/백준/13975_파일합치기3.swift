struct MinHeap<T: Comparable> { // 크기비교 해야니까 Comparable
    var heap: Array<T> = []
    
    init() { }
    init(data: T) {
        heap.append(data) // 0번 root node
    }
    init(array: Array<T>) {
        guard array.count > 0 else { return }

        for element in array {
            self.insert(element)
        }
    }
    
    mutating func insert(_ data: T) {
        if heap.isEmpty { // 비어있을 때
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
    
    mutating func pop() -> T? { // 데이터 꺼내기(삭제하기)
        if heap.count < 1 { return nil }
        
        heap.swapAt(0, heap.count - 1)
        let rootData = heap.removeLast()
        
        var nodeIndex = 0
        
        while true {
            let leftChildIndex = nodeIndex * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            // No child
            if leftChildIndex >= heap.count {
                break
            }
            // 왼
            if rightChildIndex >= heap.count {
                if heap[nodeIndex] > heap[leftChildIndex] {
                    heap.swapAt(nodeIndex, leftChildIndex)
                }
                break
            }
            
            // 왼, 오
            if heap[nodeIndex] > heap[leftChildIndex], heap[nodeIndex] > heap[rightChildIndex] {
                if heap[leftChildIndex] < heap[rightChildIndex] { // 왼 < 오 < 부모
                    heap.swapAt(nodeIndex, leftChildIndex)
                    nodeIndex = leftChildIndex
                } else { // 오 < 왼 < 부모
                    heap.swapAt(nodeIndex, rightChildIndex)
                    nodeIndex = rightChildIndex
                }
            } else if heap[nodeIndex] > heap[leftChildIndex] { // 왼 < 부모 < 오
                heap.swapAt(nodeIndex, leftChildIndex)
                nodeIndex = leftChildIndex
            } else if heap[nodeIndex] > heap[rightChildIndex] { // 오 < 부모 < 왼
                heap.swapAt(nodeIndex, rightChildIndex)
                nodeIndex = rightChildIndex
            } else {
                break
            }
        }
        return rootData
    }
}

func 파일합치기3() {
    let testCount = Int(readLine()!)!
    
    for _ in 1...testCount {
        var _ = Int(readLine()!)!
        var heap = MinHeap<Int>(array: readLine()!.split(separator: " ").compactMap { Int($0) })
        var cost = 0
        
        while heap.heap.count > 1 {
            let temp = (heap.pop() ?? 0) + (heap.pop() ?? 0)
            cost += temp
            heap.insert(temp)
        }
        
        print(cost)
    }
}
