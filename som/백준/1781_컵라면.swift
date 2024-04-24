import Foundation

func result1781() {
    struct Heap<T> {
        var heap: [T]
        
        var compare: (T, T) -> Bool
        
        var root: T? {
            return heap.isEmpty ? nil : heap[0]
        }
        
        var count: Int {
            return heap.count
        }
        
        var isEmpty: Bool {
            return heap.isEmpty
        }
        
        init(heap: [T], compare: @escaping (T, T) -> Bool) {
            self.heap = heap
            self.compare = compare
        }
        
        mutating func insert(n: T) {
            heap.append(n)
            shiftUp(i: heap.count - 1)
        }
        
        mutating func delete() -> T? {
            if heap.isEmpty {
                return nil
            }
            
            if heap.count == 1 {
                return heap.removeFirst()
            }
            
            heap.swapAt(0, heap.count - 1)
            
            let result = heap.removeLast()
            shiftDown(i: 0)
            
            return result
        }
        
        mutating func shiftUp(i: Int) {
            var now = i
            
            while now > 0 {
                
                let parent = (now - 1) / 2
                
                if compare(heap[now], heap[parent]) {
                    heap.swapAt(now, parent)
                    now = parent
                } else {
                    break
                }
            }
        }
        
        mutating func shiftDown(i: Int) {
            var now: Int = i
            var child: Int = 2 * now + 1
            let count: Int = heap.count
            
            while child < count {
                if child + 1 < count {
                    child = compare(heap[child], heap[child + 1]) ? child : child + 1
                }
                
                if compare(heap[child], heap[now]) {
                    heap.swapAt(now, child)
                    now = child
                    child = 2 * now + 1
                } else {
                    break
                }
            }
        }
    }
    
    struct PriorityQueue<T> {
        var heap: Heap<T>
        
        init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
            heap = Heap(heap: elements, compare: sort)
        }
        
        var count : Int {
            return heap.count
        }
        var isEmpty : Bool {
            return heap.isEmpty
        }
        
        func top () -> T? {
            return heap.root
        }
        
        mutating func clear () {
            while !heap.isEmpty {
                _ = heap.delete()
            }
        }
        
        mutating func pop() -> T? {
            return heap.delete()
        }
        
        mutating func push(_ element: T) {
            heap.insert(n: element)
        }
    }
    
    let workCount = Int(readLine()!)!
    var workList = [(Int, Int)]()
    var cupNoodles = [(Int, Int)]()
    var sum = 0
    var temp = 0
    
    for _ in 0..<workCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        workList.append((input[0], input[1]))
    }
    
    workList.sort { $0.0 < $1.0 }
    
    var pq: PriorityQueue<(Int, Int)> = PriorityQueue(cupNoodles, >)
    
    for work in workList {
        if pq.count < work.0 {
            pq.push(work)
        } else if pq.count == work.0 {
            if pq.top()!.1 < work.1 {
                pq.pop()
                pq.push(work)
            }
        }
    }
    
    while !pq.isEmpty {
        sum += pq.pop()!.1
    }
    
    print(sum)
}
