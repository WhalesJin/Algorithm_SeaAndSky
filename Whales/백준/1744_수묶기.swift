func 수묶기() {
    let n = Int(readLine()!)!
    var negatives = [Int]()
    var zeros = [Int]()
    var positives = [Int]()
    var negativeSum = 0
    var positiveSum = 0
    for _ in 1...n {
        let a = Int(readLine()!)!
        
        if a < 0 {
            negatives.append(a)
        } else if a == 0 {
            zeros.append(a)
        } else {
            positives.append(a)
        }
    }
    
    if !negatives.isEmpty {
        negatives = negatives.sorted()
        var max = 0
        
        if negatives.count % 2 == 1, zeros.isEmpty {
            max = negatives.last!
        }
        
        for i in stride(from: 0, to: negatives.count-1, by: 2) {
            if negatives[i+1] != 1 {
                negativeSum += negatives[i] * negatives[i+1]
            } else {
                negativeSum += negatives[i] + negatives[i+1]
            }
        }
        
        negativeSum += max
    }
    
    
    if !positives.isEmpty {
        positives = positives.sorted(by: >)
        var min = 0
        
        if positives.count % 2 == 1 {
            min = positives.last!
        }
        
        for i in stride(from: 0, to: positives.count-1, by: 2) {
            if positives[i+1] != 1 {
                positiveSum += positives[i] * positives[i+1]
            } else {
                positiveSum += positives[i] + positives[i+1]
            }
        }
        
        positiveSum += min
    }
    
    print(negativeSum+positiveSum)
}
