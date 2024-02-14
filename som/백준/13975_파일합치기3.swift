import Foundation

func result13975() {
    struct Heap<T: Comparable> {
        var elements: [T] = []
        private let sortFunction: (T, T) -> Bool

        var isEmpty: Bool {
            return self.elements.count == 1
        }

        var peek: T? {
            if self.isEmpty { return nil }
            return self.elements.last!
        }

        var count: Int {
            return self.elements.count - 1
        }

        init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
            if !elements.isEmpty {
                self.elements = [elements.first!] + elements
            } else {
                self.elements = elements
            }

            self.sortFunction = sortFunction

            if elements.count > 1 {
                self.buildHeap()
            }
        }

        func leftChild(of index: Int) -> Int {
            return index * 2
        }

        func rightChild(of index: Int) -> Int {
            return index * 2 + 1
        }

        func parent(of index: Int) -> Int {
            return (index) / 2
        }

        mutating func add(element: T) {
            self.elements.append(element)
        }

        mutating func diveDown(from index: Int) {
            var higherPriority = index
            let leftIndex = self.leftChild(of: index)
            let rightIndex = self.rightChild(of: index)

            if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
                higherPriority = leftIndex
            }

            if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
                higherPriority = rightIndex
            }

            if higherPriority != index {
                self.elements.swapAt(higherPriority, index)
                self.diveDown(from: higherPriority)
            }
        }

        mutating func swimUp(from index: Int) {
            var index = index
            while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
                self.elements.swapAt(index, self.parent(of: index))
                index = self.parent(of: index)
            }
        }

        mutating func buildHeap() {
            for index in (1...(self.elements.count / 2)).reversed() {
                self.diveDown(from: index)
            }
        }

        mutating func insert(node: T) {
            if self.elements.isEmpty {
                self.elements.append(node)
            }
            self.elements.append(node)
            self.swimUp(from: self.elements.endIndex - 1)
        }

        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            self.elements.swapAt(1, elements.endIndex - 1)
            let deleted = elements.removeLast()
            self.diveDown(from: 1)

            return deleted
        }
    }

    struct PriorityQueue<T: Comparable> {
        var heap: Heap<T>

        init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
            heap = Heap(elements: elements, sortFunction: sort)
        }

        var count : Int {
            return heap.count
        }
        var isEmpty : Bool {
            return heap.isEmpty
        }

        func top () -> T? {
            return heap.peek
        }

        mutating func clear () {
            while !heap.isEmpty {
                _ = heap.remove()
            }
        }
        mutating func pop() -> T? {
            return heap.remove()
        }
        mutating func push(_ element: T) {
            heap.insert(node: element)
        }
    }

    func solution(_ nodes: [Int]) -> Int {
        var answer = 0
        var pq = PriorityQueue<Int>(nodes, <)

        while pq.count > 1 {
            let num1 = pq.pop() ?? 0
            let num2 = pq.pop() ?? 0
            let sum = num1 + num2

            answer += sum
            pq.push(sum)
        }

        return answer
    }

    let T = Int(readLine()!)!

    for _ in 0..<T {
        let K = Int(readLine()!)!
        let elements = readLine()!.split(separator: " ").map { Int($0)! }
        print(solution(elements))
    }

}
