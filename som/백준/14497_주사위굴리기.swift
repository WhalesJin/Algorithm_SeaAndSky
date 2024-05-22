import Foundation

func result14497() {
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

    struct Wave {
        var cost: Int
        var x: Int
        var y: Int
    }

    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: 301), count: 301)
    var nextMap: [[Int]] = Array(repeating: Array(repeating: 0, count: 301), count: 301)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 301), count: 301)
    let moveY: [Int] = [-1, 0, 1, 0]
    let moveX: [Int] = [0, -1, 0, 1]
    var answer: Int = 0

    let input = readLine()!.components(separatedBy: " ")
    let n = Int(input[0])!
    let m = Int(input[1])!

    let input2 = readLine()!.components(separatedBy: " ")
    let y1 = Int(input2[0])!
    let x1 = Int(input2[1])!
    let y2 = Int(input2[2])!
    let x2 = Int(input2[3])!

    for i in 1...n {
        let S = readLine()!
        for j in 1...m {
            if S[S.index(S.startIndex, offsetBy: j-1)] == "0" {
                map[i][j] = 0
            } else if S[S.index(S.startIndex, offsetBy: j-1)] == "1" {
                map[i][j] = 1
            } else if S[S.index(S.startIndex, offsetBy: j-1)] == "*" {
                map[i][j] = -1
            } else if S[S.index(S.startIndex, offsetBy: j-1)] == "#" {
                map[i][j] = 2
            }
        }
    }

    while true {
        answer += 1

        nextMap = map
        visited = Array(repeating: Array(repeating: false, count: 301), count: 301)

        if bfs() {
            break
        }

        map = nextMap
    }

    print(answer)

    func bfs() -> Bool {
        var heap = Heap<Wave>(compare: { $0.cost < $1.cost })
        visited[y1][x1] = true
        heap.insert(n: Wave(cost: 0, x: x1, y: y1))

        while !heap.isEmpty {
            let currentInfo = heap.delete()!
            let currentCost = currentInfo.cost
            let currentY = currentInfo.y
            let currentX = currentInfo.x

            if (currentY == y2) && (currentX == x2) {
                answer = min(answer, currentCost)
                continue
            }

            for i in 0..<4 {
                let nextY = currentY + moveY[i]
                let nextX = currentX + moveX[i]

                if (nextY < 1) || (nextY > n) || (nextX < 1) || (nextX > m) || visited[nextY][nextX] {
                    continue
                }

                visited[nextY][nextX] = true

                if map[nextY][nextX] == 0 {
                    heap.insert(n: Wave(cost: currentCost, x: nextX, y: nextY))
                } else if map[nextY][nextX] == 1 {
                    nextMap[nextY][nextX] = 0
                    continue
                } else if map[nextY][nextX] == 2 {
                    return true
                }
            }
        }

        return false
    }
}
