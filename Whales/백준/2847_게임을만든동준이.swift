func 게임을만든동준이() {
    let n = Int(readLine()!)!
    var scores = [Int](repeating: 0, count: n)
    
    for i in 0..<n {
        scores[i] = Int(readLine()!)!
    }
    
    var count = 0
    var temp = scores.removeLast()
    
    while !scores.isEmpty {
        let score = scores.removeLast()
        
        if score >= temp {
            count += score - temp + 1
            temp -= 1
        } else {
            temp = score
        }
    }
    
    print(count)
}
