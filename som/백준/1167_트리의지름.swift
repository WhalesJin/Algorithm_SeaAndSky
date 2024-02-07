import Foundation

func result1167() {
    let n = Int(readLine()!)!
    var visited = Array(repeating: false, count: n + 1)
    var trees = [[(Int, Int)]](repeating: [], count: n + 1)

    for _ in 0..<n {
        let input = readLine()!.dropLast(2).split(separator: " ").map { Int($0)! }
        let node = input[0]
        var index = 1

        while index < input.count {
            trees[node].append((input[index], input[index + 1]))
            index += 2
        }
    }

    var endNode: (node: Int, cost: Int) = (node: 0, cost: 0)

    func deepDive(node: Int, depth: Int) {
        visited[node] = true

        if depth > endNode.cost {
            endNode = (node, depth)
        }

        for (nextNode, distance) in trees[node] {
            if !visited[nextNode] {
                visited[nextNode] = true
                deepDive(node: nextNode, depth: depth + distance)
                visited[nextNode] = false
            }
        }
    }

    deepDive(node: 1, depth: 0)
    visited = [Bool](repeating: false, count: n + 1)
    deepDive(node: endNode.node, depth: 0)
    print(endNode.cost)
}
