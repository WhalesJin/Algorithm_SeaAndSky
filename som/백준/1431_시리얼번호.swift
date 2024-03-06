import Foundation

func result1431() {
    let count = Int(readLine()!)!
    var array = [String]()

    for _ in 0..<count {
        array.append(readLine()!)
    }

    array.sort {
        if $0.count == $1.count {
            if addInt($0) == addInt($1) {
                return $0 < $1
            } else {
                return addInt($0) < addInt($1)
            }
        } else {
            return $0.count < $1.count
        }
    }

    array.forEach { print($0) }

    func addInt(_ str: String) -> Int {
        let string = str.map { String($0) }
        var sum = 0

        for str in string {
            if Int(str) != nil {
                sum += Int(str) ?? 0
            }
        }

        return sum
    }
}
