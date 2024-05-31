func 비슷한단어() { // 첫 단어가 기준
    let n = Int(readLine()!)!
    let standard = readLine()!
    var count = 0
    
    for _ in 0..<n-1 {
        let string = readLine()!
        
        if isSimilar(string, to: standard) {
            count += 1
        }
    }
    
    print(count)
    
    func isSimilar(_ a: String, to b: String) -> Bool {
        let arrayA = a.map({ String($0) }).sorted()
        var arrayB = b.map({ String($0) }).sorted()
        
        if arrayA == arrayB { // 구성이 같은 경우
            return true
        }
        
        if (-1...1 ~= (arrayA.count - arrayB.count)) == false { // 글자 개수가 2개 이상 차이나면 false
            return false
        }
        
        //gooodd ggooood -> 글자개수는 1개 차이지만 false
        var temp = 0
        
        for char in arrayA {
            if arrayB.contains(char) {
                arrayB.remove(at: arrayB.firstIndex(of: char)!)
            } else {
                temp += 1
            }
        }
        
        if temp <= 1 && arrayB.count <= 1 {
            return true
        }
        
        return false
    }
}
