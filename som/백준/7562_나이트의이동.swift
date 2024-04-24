import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    solution()
}

func solution() {
    let round = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let end = readLine()!.split(separator: " ").map { Int($0)! }
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: round), count: round)
    let dx = [1, 2, 2, 1, -1, -2, -2, -1]
    let dy = [-2, -1, 1, 2, 2, 1, -1, -2]

    bfs(start[1], start[0])

    func bfs(_ x: Int, _ y: Int) {
        var queue = [(y, x, 0)]
        var index = 0
        visited[y][x] = true

        while queue.count > index {
            let y = queue[index].0
            let x = queue[index].1
            let moveCount = queue[index].2

            if y == end[0] && x == end[1] {
                print(moveCount)
                break
            }

            for i in 0..<8 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]

                if isVaildRange(nextX, nextY) && !visited[nextY][nextX] {
                    visited[nextY][nextX] = true
                    queue.append((nextY, nextX, moveCount + 1))
                }
            }

            index += 1
        }
    }

    func isVaildRange(_ x: Int, _ y: Int) -> Bool {
        return 0..<round ~= y && 0..<round ~= x
    }
}
