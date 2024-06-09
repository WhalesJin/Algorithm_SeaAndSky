import Foundation

func result2607() {
    let count = Int(readLine()!)!
    var words = [[String]]()
    var answer = 0

    for _ in 0..<count {
        words.append(readLine()!.map { String($0) })
    }

    let mainWord = words[0]

    for i in 1..<count {
        var visited = Array(repeating: false, count: words[i].count)
        var temp = 0

        for word in mainWord {
            var isSimilar = false

            for j in words[i].indices {
                if visited[j] { continue }
                if words[i][j] == word {
                    visited[j] = true
                    isSimilar = true
                    break
                }
            }

            if !isSimilar {
                temp += 1
            }
        }

        let result = visited.reduce(0, { $0 + ($1 == true ? 0 : 1)})

        if temp < 2 && result < 2 {
            answer += 1
        }
    }

    print(answer)
}
