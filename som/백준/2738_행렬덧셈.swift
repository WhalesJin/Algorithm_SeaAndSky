import Foundation

func result2738() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0], m = input[1]

    var arrayA: [[Int]] = []
    var arrayB: [[Int]] = []
    var answer = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

    for _ in 0..<n {
        arrayA.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    for _ in 0..<n {
        arrayB.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    for y in 0..<n {
        for x in 0..<m {
            answer[y][x] = arrayA[y][x] + arrayB[y][x]
        }
    }

    for y in 0..<n {
        answer[y].forEach { print($0, terminator: " ") }
        print()
    }

}
