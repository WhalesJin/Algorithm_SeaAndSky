import Foundation

func result1012() {
    let testCase = Int(readLine()!)!

    for _ in 0..<testCase {
        solution()
    }

    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (m, n, k) = (input[0], input[1], input[2])
        var round = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]
        var answer = 0

        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (x, y) = (input[0], input[1])
            round[y][x] = 1
        }

        for y in 0..<n {
            for x in 0..<m {
                if !visited[y][x] && round[y][x] == 1 {
                    answer += 1
                    dfs(x, y)
                }
            }
        }

        print(answer)

        func dfs(_ x: Int, _ y: Int) {
            visited[y][x] = true

            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]

                if vaildRange(nextX, nextY) && !visited[nextY][nextX] && round[nextY][nextX] == 1 {
                    visited[nextY][nextX] = true
                    dfs(nextX, nextY)
                }
            }
        }

        func vaildRange(_ x: Int, _ y: Int) -> Bool {
            return 0..<n ~= y && 0..<m ~= x
        }
    }

}
