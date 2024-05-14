import Foundation

func result2660() {
    let peopleCount = Int(readLine()!)!
    var peopleList = [[Int]](repeating: [Int](), count: peopleCount + 1)

    while true {
        let input = readLine()!.split(separator: " ").map { Int($0)! }

        if input[0] == -1, input[1] == -1 { break }

        peopleList[input[0]].append(input[1])
        peopleList[input[1]].append(input[0])
    }

    func bfs(_ index: Int) -> Int {
        var visit = Array(repeating: false, count: peopleCount + 1)
        var queue = [(index, 0)]
        var temp = 0
        var score = 0
        visit[index] = true

        while queue.count > temp {
            let friend = queue[temp]
            temp += 1
            score = max(score, friend.1)

            for next in peopleList[friend.0] {
                if visit[next] { continue }
                visit[next] = true
                queue.append((next, friend.1 + 1))
            }
        }

        return score
    }

    var score = Int.max
    var answer = [Int]()
    for i in 1...peopleCount {
        let s = bfs(i)
        if score >= s {
            if score > s {
                answer = [i]
            } else {
                answer.append(i)
            }
            score = s
        }
    }

    print(score, answer.count)
    answer.forEach{print($0, terminator: " ")}
}
