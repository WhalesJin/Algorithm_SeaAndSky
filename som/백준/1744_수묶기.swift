import Foundation

func result1744() {
    var plusArray = [Int]()
    var minusArray = [Int]()
    var answer = 0
    let n = Int(readLine()!)!

    for _ in 0..<n {
        let input = Int(readLine()!)!

        if input > 1 {
            plusArray.append(input)
        } else if input == 1 {
            answer += 1
        } else {
            minusArray.append(input)
        }
    }

    plusArray.sort(by: > )
    minusArray.sort(by: < )

    if plusArray.count % 2 == 1 {
        answer += plusArray.removeLast()
    }

    if minusArray.count % 2 == 1 {
        answer += minusArray.removeLast()
    }

    while plusArray.count > 0 || minusArray.count > 0 {
        if plusArray.count > 0 {
            answer += plusArray.removeLast() * plusArray.removeLast()
        }

        if minusArray.count > 0 {
            answer += minusArray.removeLast() * minusArray.removeLast()
        }
    }

    print(answer)
}
