import Foundation

func result19640() {
    struct Employee {
        var d: Int
        var h: Int
        var l: Int
        var isMe: Bool
    }

    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0], m = firstLine[1]
    var k = firstLine[2]
    var list: [[Employee]] = Array(repeating: [], count: m)
    var idx = 0
    var cnt = n

    while cnt > 0 {
        cnt -= 1
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        idx += 1
        let check = k == 0
        k -= 1
        list[idx % m].append(Employee(d: line[0], h: line[1], l: idx % m, isMe: check))
    }

    cnt = 0

    var pq = Heap<Employee> { (o1, o2) -> Bool in
        if o1.d == o2.d {
            if o1.h == o2.h {
                return o1.l < o2.l
            } else {
                return o1.h > o2.h
            }
        } else {
            return o1.d > o2.d
        }
    }

    for j in 0..<m {
        if list[j].count > 0 {
            pq.insert(n: list[j][0])
        }
    }

    for _ in 0..<n {
        let current = pq.delete()!
        if current.isMe {
            print(cnt)
            break
        } else {
            cnt += 1
            list[current.l].remove(at: 0)
            if list[current.l].count > 0 {
                pq.insert(n: list[current.l][0])
            }
        }
    }

    struct Heap<T> {
        var heap = Array<T>()
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

        init(compare: @escaping (T, T) -> Bool) {
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

}
