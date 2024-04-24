import Foundation

func result1043() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (personCount, partyCount) = (input[0], input[1])
    let truth = readLine()!.split(separator: " ").map { Int($0)! }
    var people = [[Int]](repeating: [Int](), count: personCount + 1)
    var parties = [[Int]](repeating: [Int](), count: partyCount)
    var visited = [Bool](repeating: false, count: personCount + 1)
    var answer = 0

    if truth.count == 1 {
        print(partyCount)
    } else if partyCount == 1 {
        print(0)
    } else {
        for i in 0..<partyCount {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }

            for j in 1..<input.count {
                people[input[j]].append(i) // people[1...4] = [0]
                parties[i].append(input[j]) // parties[1] = [1, 2, 3, 4]
            }
        }

        for i in 1..<truth.count {
            dfs(truth[i])
        }

        for i in 0..<partyCount {
            answer += parties[i].filter{visited[$0] == false}.count > 0 ? 1 : 0
        }

        print(answer)
    }

    func dfs(_ index: Int) {
        for party in people[index] { // 0
            for person in parties[party] { // 1, 2, 3, 4
                if visited[person] {
                    continue
                }

                visited[person] = true
                dfs(person)
            }
        }
    }

}
