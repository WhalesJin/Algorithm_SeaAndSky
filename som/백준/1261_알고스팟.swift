import Foundation

func result1261() {
    let mn = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let m = mn[0]
    let n = mn[1]
    var arr = Array(repeating: [Int](), count: n)
    let distance = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var visit = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = [(Int, Int, Int)]()

    for i in 0..<n {
        let input = readLine()!.map { Int(String($0))! }
        arr[i] = input
    }

    queue.insert((0, 0, 0), at: 0)
    visit[0][0] = true
    bfs()

    func bfs() {
        while !queue.isEmpty {
            let currentX = queue.first!.0
            let currentY = queue.first!.1
            let currentCount = queue.first!.2

            queue.removeFirst()

            if currentX == m - 1 && currentY == n - 1 {
                print(currentCount)
                break
            }

            for i in 0..<4 {
                let nextX = currentX + distance[i].0
                let nextY = currentY + distance[i].1

                if nextX < 0 || nextX >= m || nextY < 0 || nextY >= n {
                    continue
                }

                if visit[nextY][nextX] == true {
                    continue
                }

                if arr[nextY][nextX] == 0 {
                    queue.insert((nextX, nextY, currentCount), at: 0)
                } else {
                    queue.append((nextX, nextY, currentCount + 1))
                }

                visit[nextY][nextX] = true
            }
        }
    }
}
