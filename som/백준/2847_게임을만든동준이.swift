import Foundation

func result2847() {
    let n = Int(readLine()!)!
    var level = [Int]()
    var sum = 0

    for _ in 0..<n {
        level.append(Int(readLine()!)!)
    }

    for i in (0..<level.count - 1).reversed() {
        if level[i + 1] <= level[i] {
            sum += (level[i] - level[i + 1] + 1)
            level[i] = level[i + 1] - 1
        }
    }

    print(sum)
}
