import Foundation

func result2143() {
    let t = Int(readLine()!)!
    let n = Int(readLine()!)!
    let nArray = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    let mArray = readLine()!.split(separator: " ").map { Int($0)! }
    var dict = [Int: Int]()

    for i in 0..<n {
        for j in i..<n {
            let sum = nArray[i...j].reduce(0, +)

            if dict[sum] != nil {
                dict[sum]! += 1
            } else {
                dict[sum] = 1
            }
        }
    }

    var result = 0

    for i in 0..<m {
        for j in i..<m {
            let sum = mArray[i...j].reduce(0, +)

            if dict[t - sum] != nil {
                result += dict[t - sum]!
            }
        }
    }

    print(result)
}
