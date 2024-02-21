// 최소 힙을 이용하여 다음과 같은 연산을 지원하는 프로그램을 작성하시오.
// 1. 배열에 자연수 x를 넣는다.
// 2. 배열에서 가장 작은 값을 출력하고, 그 값을 배열에서 제거한다.
// 프로그램은 처음에 비어있는 배열에서 시작하게 된다.

struct Heap<T: Comparable> { // 크기비교 해야니까 Comparable
    var heap: Array<T> = []
    
    init() { }
    init(data: T) {
        heap.append(data) // 0번 index 채우기용
        heap.append(data) // 1번 index -> 실제 root node
    }
    
    mutating func insert(_ data: T) {
        if heap.isEmpty { // 비어있을 때는 0번까지
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        var insertIndex = heap.count - 1
        var parentIndex = insertIndex / 2
        
        while heap[parentIndex] > heap[insertIndex] {
            if insertIndex <= 1 {
                break
            }
            
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
            parentIndex = insertIndex / 2
        }
    }
    
    mutating func pop() -> T? { // 데이터 꺼내기(삭제하기)
        if heap.count <= 1 { return nil }
        
        heap.swapAt(1, heap.count - 1)
        let rootData = heap.removeLast()
        
        var nodeIndex = 1
        
        while true {
            let leftChildIndex = nodeIndex * 2
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

let n = Int(readLine()!)!
var heap = Heap<Int>()

for _ in 1...n {
    let input = Int(readLine()!)!

    if input == 0 {
        print(heap.pop() ?? 0)
        continue
    }

    heap.insert(input)
}
