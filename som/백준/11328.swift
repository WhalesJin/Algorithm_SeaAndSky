// Strfry

let n = Int(readLine()!)!

for _ in 0..<n {
    print(solution(readLine()!))
}

func solution(_ string: String) -> String {
    var input = string.components(separatedBy: " ").map { String($0) }

    for i in input[1] {
        var count1 = 0
        var count2 = 0

        for j in input[0] {
            if i == j {
                count1 += 1
            }
        }

        for j in input[1] {
            if i == j {
                count2 += 1
            }
        }

        if count1 != count2 {
            return "Impossible"
        } else {
            input[0] = input[0].filter { $0 != i }
            input[1] = input[1].filter { $0 != i }
        }
    }

    return "Possible"
}
