import Foundation

func result2812() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    var k = input[1]
    var numArray: [Character] = Array(readLine()!)
    var answers: [Character] = []
    var answer = ""

    for i in 0..<n {
        while k > 0 && !answers.isEmpty && answers.last! < numArray[i] {
            answers.popLast()
            k -= 1
        }

        answers.append(numArray[i])
    }

    for i in 0..<answers.count - k {
        answer += String(answers[i])
    }

    print(answer)
}
