import Foundation

func result11279() {
    struct Heap<T: Comparable> {
        private var elements: [T] = []
        private let sortFunction: (T, T) -> Bool

        init (sortFunction: @escaping (T, T) -> Bool) {
            self.sortFunction = sortFunction
        }

        var isEmpty: Bool {
            return self.elements.count == 1
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

        mutating func insert(node: T) {
            if self.isEmpty {
                self.elements.append(node)
                return
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

    let count = Int(readLine()!)!
    var heap = Heap<Int>(sortFunction: >)

    heap.insert(node: 0)

    for _ in 0..<count {
        let input = Int(readLine()!)!

        switch input {
        case 0:
            print(heap.remove() ?? 0)

        default:
            heap.insert(node: input)
        }
    }
}
