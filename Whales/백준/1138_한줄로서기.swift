func 한줄로서기() {
    // 뒤에서부터 와야겠다
    let n = Int(readLine()!)!
    let largeCount = readLine()!.split(separator: " ").compactMap { Int($0) }
    var result = [n]
    
    for i in stride(from: n-2, through: 0, by: -1) {
        result.append(i+1)
        let index = largeCount[i]
        let count = result.count
        if index == count {
            continue
        }
        
        for j in index..<count-1 {
            result.swapAt(j, count-1)
        }
        
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}
