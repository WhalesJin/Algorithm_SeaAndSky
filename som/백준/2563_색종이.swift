import Foundation

func result2563() {
    var paper = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)

    let n = Int(readLine()!)!
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0], y = input[1]
        for y in y..<y + 10 {
            for x in x..<x + 10 {
                paper[y][x] = true
            }
        }
    }

    print(paper.flatMap { $0 }.filter { $0 }.count)
}
