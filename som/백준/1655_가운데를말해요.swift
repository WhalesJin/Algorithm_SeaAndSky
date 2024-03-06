import Foundation

struct Heap<T: Comparable> {
    var heap: [T]

    var compare: (T, T) -> Bool

    var root: T? {
        return heap.isEmpty ? nil : heap[0]
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    init(compare: @escaping (T, T) -> Bool) {
        self.heap = []
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

var maxHeap: Heap<Int> = Heap(compare: >)
var minHeap: Heap<Int> = Heap(compare: <)

let n: Int = Int(readLine()!)!
var answer: String = ""

for i in 1 ... n {
    let input: Int = Int(readLine()!)!

    if i % 2 == 0 {
        minHeap.insert(n: input)
    } else {
        maxHeap.insert(n: input)
    }

    if minHeap.root == nil {
        answer += "\(maxHeap.root!)\n"
        continue
    }

    let maxRoot: Int = maxHeap.root!
    let minRoot: Int = minHeap.root!

    if maxRoot > minRoot {
        minHeap.heap[0] = maxRoot
        maxHeap.heap[0] = minRoot
    }

    if i % 2 == 0 { maxHeap.shiftDown(i: 0) }
    else { minHeap.shiftDown(i: 0) }

    answer += "\(maxHeap.root!)\n"
}

print(answer)
