import Foundation

func result11501() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let n = Int(readLine()!)!
        var price = readLine()!.split(separator: " ").map{ Int($0)! }
        var answer = 0

        var maxNum = price[price.count - 1]

        for i in stride(from: price.count - 1, through: 0, by: -1) {
            if maxNum < price[i] {
                maxNum = price[i]
            } else if price[i] < maxNum {
                answer += maxNum - price[i]
            }
        }

        print(answer)
    }

}
