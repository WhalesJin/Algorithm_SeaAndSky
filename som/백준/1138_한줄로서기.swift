import Foundation

func result1138() {
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator : " ").map { Int(String($0))! }
    var array = Array(repeating : 0, count : n)
    
    for i in 0..<n {
        var temp = 0
        
        for j in 0..<n {
            if array[j] == 0 || array[j] > i + 1 {
                if temp == input[i] {
                    array[j] = i + 1
                    break
                } else {
                    temp += 1
                }
            }
        }
        
    }
    
    array.forEach{print($0, terminator : " " )}
}
