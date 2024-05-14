import Foundation

func result1238() {
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

    struct Load {
        let endPoint: Int // 도착지
        let cost: Int // 가중치
    }

    let nmx = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, x) = (nmx[0], nmx[1], nmx[2])
    var map = [[Load]](repeating: [Load](), count: n + 1)

    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (s, e, t) = (data[0], data[1], data[2])
        map[s].append(Load(endPoint: e, cost: t))
    }

    // 다익스트라 알고리즘
    func dijkstra(_ start: Int, _ end: Int) -> Int {
        var distance = [Int](repeating: Int.max, count: n + 1)
        var visited = [Bool](repeating: false, count: n + 1)
        var heap = Heap<(node: Int, distance: Int)>(compare: { $0.distance < $1.distance })

        distance[start] = 0

        heap.insert(n: (start, 0))

        while let (current, cost) = heap.delete() {
            if current == end { return cost }
            if distance[current] < cost, visited[current] { continue }
            visited[current] = true

            for load in map[current] {
                if visited[load.endPoint] { continue }

                let nextCost = cost + load.cost

                if nextCost < distance[load.endPoint] {
                    distance[load.endPoint] = nextCost
                    heap.insert(n: (load.endPoint, nextCost))
                }
            }
        }

        return distance[end]
    }

    var maxCost = 0

    for s in 1...n where s != x {
        let cost = dijkstra(s, x) + dijkstra(x, s)

        if cost > maxCost {
            maxCost = cost
        }
    }

    print(maxCost)
}
