import Foundation

// 내가 푼 풀아
//struct TreeNode {
//    let parentNode: Int
//    let childNode: Int
//}
//
//var trees: [TreeNode] = []
//let count = Int(readLine()!)!
//
//for _ in 0..<count - 1 {
//    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
//
//    trees.append(TreeNode(parentNode: input[0], childNode: input[1]))
//}
//
//trees.sorted { a, b in
//    a.childNode < b.childNode
//}
//
//for i in trees {
//    print(i.parentNode)
//}

// 블로그 참고
func result11725() {
    let n = Int(readLine()!)!
    var visited = Array(repeating: false, count: n + 1)
    var trees = Array(repeating: [Int](), count: n + 1)
    var parents = Array(repeating: 0, count: n + 1)

    func findParent(_ node: Int) {
        visited[node] = true

        for i in 0..<trees[node].count {
            let nextNode = trees[node][i]

            if visited[nextNode] == false {
                parents[nextNode] = node
                findParent(nextNode)
            }
        }
    }

    for _ in 0..<n - 1 {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

        trees[input[0]].append(input[1])
        trees[input[1]].append(input[0])
    }

    findParent(1)

    print(parents[2...n].map { String($0) }.joined(separator: "\n"))
}
