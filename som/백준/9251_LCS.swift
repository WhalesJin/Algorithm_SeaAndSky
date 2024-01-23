import Foundation

func result9251() {
    let first = readLine()!.map { String($0) }
    let second = readLine()!.map { String($0) }

    var matchingArray: [[Int]] = Array(repeating: Array(repeating: 0, count: second.count + 1), count: first.count + 1)

    for i in 1...first.count {
        for j in 1...second.count {
            if first[i-1] == second[j-1] {
                matchingArray[i][j] = matchingArray[i-1][j-1] + 1
            } else {
                matchingArray[i][j] = max(matchingArray[i][j-1], matchingArray[i-1][j])
            }
        }
    }

    print(matchingArray[first.count][second.count])
}
