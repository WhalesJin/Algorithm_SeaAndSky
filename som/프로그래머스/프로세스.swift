import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var result = 0
    var location = location

    while p.count != 0 {
        location -= 1
        let max = p.max()!
        let l = p[0]

        if l != max {
            p.append(l)
            p.removeFirst()
            if location < 0 { location = p.count - 1}
        }
        else {
            result += 1
            p.removeFirst()
            if location < 0 { break }
        }
    }
    return result
}
