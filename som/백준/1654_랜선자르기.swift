import Foundation

func result1654() {
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let k = firstLine[0]
    let n = firstLine[1]
    var lines = [Int]()

    for _ in 0..<k {
        lines.append(Int(readLine()!)!)
    }

    var first = 1
    var last = lines.max()!
    var answer = 0

    while first <= last {
        var temp = 0
        let mid = (first + last) / 2

        for line in lines {
            temp += line / mid
        }

        if temp >= n {
            if answer < mid {
                answer = mid
            }
            first = mid + 1
        } else {
            last = mid - 1
        }
    }

    print(answer)
}
