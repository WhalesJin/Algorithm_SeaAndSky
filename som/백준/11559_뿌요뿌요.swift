import Foundation

func result11559() {
    let row = 12, col = 6
    var stage = [[Character]]()
    let moveY: [Int] = [-1, 0, 1, 0]
    let moveX: [Int] = [0, -1, 0, 1]
    var answer = 0
    var flag = true

    for _ in 0..<row {
        let input: [Character] = Array(readLine()!)
        stage.append(input)
    }

    // 연쇄 시점 잡기... 그게 언젠데...?
    while flag {
        flag = false

        for y in 0..<row {
            for x in 0..<col {
                if stage[y][x] == "." { continue }

                let current = bfs((y, x), stage[y][x])

                if current.count < 4 { continue }

                for (y, x) in current {
                    stage[y][x] = "."
                }

                flag = true
            }
        }

        rebase()

        if flag {
            answer += 1
        }
    }

    print(answer)

    // 터지는 시점에 실행되게 하면 될 거 같구
    func bfs(_ index: (Int, Int), _ s: Character) -> [(Int, Int)] {
        var queue = [(index.0, index.1)]
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        var memory = [(index.0, index.1)]
        visited[index.0][index.1] = true

        while !queue.isEmpty {
            let current = queue.removeLast()

            for i in 0..<4 {
                let next = (current.0 + moveY[i], current.1 + moveX[i])

                if 0 <= next.0 && next.0 < row && 0 <= next.1 && next.1 < col && !visited[next.0][next.1] && stage[next.0][next.1] == s {
                    visited[next.0][next.1] = true
                    queue.append(next)
                    memory.append(next)
                }
            }
        }

        return memory
    }

    func rebase() {
        for i in (0..<12).reversed() {
            for j in 0..<6 {
                if stage[i][j] == "." {
                    continue
                }
                move(i, j)
            }
        }
    }

    func move(_ y: Int, _ x: Int) {
        var current = y + 1

        while true {
            if current >= 12 || stage[current][x] != "." {
                break
            }

            current += 1
        }

        if current - 1 != y {
            stage[current - 1][x] = stage[y][x]
            stage[y][x] = "."
        }
    }
}
