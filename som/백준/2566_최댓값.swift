import Foundation

func result2566() {
    var array = [[Int]]()

    for _ in 0..<9 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        array.append(input)
    }

    let maxValue = array.flatMap { $0 }.max()!

    for x in 0..<9 {
        for y in 0..<9 {
            if array[x][y] == maxValue {
                print(maxValue)
                print(x + 1, y + 1)
                break
            }
        }
    }
}
