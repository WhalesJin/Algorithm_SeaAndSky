import Foundation

func result1932() {
    let lineCount = Int(readLine()!)!
    var triangle: [[Int]] = []

    for _ in 0..<lineCount {
        triangle.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
    }

    for i in 1..<lineCount {
        for j in 0..<i + 1 {
            if j == 0 {
                triangle[i][j] += triangle[i - 1][j]
            } else if j == i {
                triangle[i][j] += triangle[i - 1][j - 1]
            } else {
                triangle[i][j] += max(triangle[i - 1][j], triangle[i - 1][j - 1])
            }
        }
    }

    print(triangle[lineCount - 1].max()!)
}
