import Foundation

func result11652() {
    let count = Int(readLine()!)!
    var countArray = [Int: Int]()
    var num = 0

    for _ in 0..<count {
        num = Int(readLine()!)!
        if countArray[num] == nil {
            countArray[num] = 1
        } else {
            countArray[num]! += 1
        }
    }

    var maxCount = countArray[num]!
    var maxNum = num

    for (number, count) in countArray {
        if (count > maxCount) || (count == maxCount && number < maxNum) {
            maxCount = count
            maxNum = number
        }
    }

    print(maxNum)
}
