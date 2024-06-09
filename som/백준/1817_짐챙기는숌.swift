import Foundation

func result1817() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let bookCount = input[0], maxWeight = input[1]
    var answer = 0
    var weight = 0

    if let inputs = readLine() {
        let books = inputs.split(separator: " ").map { Int($0)! }

        for i in 0..<bookCount {
            if weight + books[i] > maxWeight {
                weight = books[i]
                answer += 1
            } else {
                weight += books[i]
            }
        }

        if weight > 0 {
            answer += 1
        }

        print(answer)
    } else {
        print(answer)
    }
}
