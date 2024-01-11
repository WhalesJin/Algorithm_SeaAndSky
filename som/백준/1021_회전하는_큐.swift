import Foundation

func result1021() {
    let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    var array = Array(1...input[0])
    var answer = 0
    var targets = Array(readLine()!.split(separator: " ").map { Int($0)! })

    while targets.isEmpty == false {
        let index = array.firstIndex(of: targets[0])!

        if targets[0] == array[0] {
            targets.removeFirst()
            array.removeFirst()
        } else if index > array.count / 2 {
            array.insert(array.removeLast(), at: 0)
            answer += 1
        } else {
            array.append(array.removeFirst())
            answer += 1
        }
    }

    print(answer)
}
