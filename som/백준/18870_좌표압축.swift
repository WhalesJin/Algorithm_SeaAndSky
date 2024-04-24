import Foundation

let count = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var answer = [Int: Int]()
var num = 0

for i in array.sorted() {
    if answer[i] == nil {
        answer[i] = num
        num += 1
    }
}

print("\(array.map { String(answer[$0]!) }.joined(separator: " "))")
