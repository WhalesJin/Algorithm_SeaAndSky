import Foundation

func result4485() {
    var answer = [String]()
    var problemCount = 1

    while let input = readLine() {
        if input == "0" {
            break
        }
        let line = Int(input)!

        var array = Array(repeating: Array(repeating: 0, count: line), count: line)
        var cost = Array(repeating: Array(repeating: Int.max, count: line), count: line)
        var visited = Array(repeating: Array(repeating: false, count: line), count: line)

        let (dx, dy) = ([-1, 1, 0, 0], [0,0,1,-1])
        
        var queue = [(Int, Int, Int)]()

        for i in 0..<line{
            let input = readLine()!.split(separator: " ").map{ Int($0)! }

            for k in 0..<line {
                array[i][k] = input[k]
            }
        }

        queue.append((0, 0, array[0][0]))

        while !queue.isEmpty {
            let current = queue.removeLast()
            let x = current.0
            let y = current.1

            visited[x][y] = true
            cost[x][y] = min(cost[x][y], current.2)

            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]

                if nextX < 0 || nextX >= line || nextY < 0 || nextY >= line || visited[nextX][nextY] { continue
                }

                queue.append((nextX, nextY, cost[x][y] + array[nextX][nextY]))
            }

            queue.sort(by: {$0.2 > $1.2})
        }

        answer.append("Problem \(problemCount): \(cost[line - 1][line - 1])")
        problemCount += 1
    }

    print(answer.joined(separator: "\n"))
}
