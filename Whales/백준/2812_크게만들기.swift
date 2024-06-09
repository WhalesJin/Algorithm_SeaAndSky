func 크게만들기() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    var k = input[1]
    let count = n - k
    let number = readLine()!.compactMap { Int(String($0)) }
    var tempArr = [Int]()
    
    for value in number {
        while let last = tempArr.last, k > 0, last < value {
                tempArr.removeLast()
                k -= 1
        }
        
        tempArr.append(value)
    }
    
    for i in 0..<count {
        print(tempArr[i], terminator: "")
    }
}
