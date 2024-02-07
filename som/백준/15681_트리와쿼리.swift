import Foundation

func result15681() {
    let inputs = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = inputs[0]
    let r = inputs[1]
    let q = inputs[2]
    var trees = [[Int]](repeating: [], count: n + 1)
    var queries = [Int](repeating: 0, count: n + 1)
    var answer = ""

    for _ in 0..<n - 1 {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

        trees[input[0]].append(input[1])
        trees[input[1]].append(input[0])
    }

    func findQuery(_ node: Int) {
        queries[node] = 1

        for nextNode in trees[node] {
            if queries[nextNode] == 0 {
                findQuery(nextNode)
                queries[node] += queries[nextNode]
            }
        }
    }

    findQuery(r) // 5

    for _ in 0..<q {
        let node = Int(readLine()!)!
        answer += "\(queries[node])\n"
    }

    print(answer)
}
