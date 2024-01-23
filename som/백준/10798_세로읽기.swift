import Foundation

func result10798() {
    var array = [[String]](repeating: [String](repeating: "", count: 15), count: 5)

    for y in 0..<5 {
        let word = readLine()!.map { String($0) }
        array[y].replaceSubrange(0..<word.count - 1, with: word)
    }

    for x in 0..<15 {
        for y in 0..<5 {
            print(array[y][x], terminator: "")
        }
    }
}
