//  Xi > Xj를 만족하는 서로 다른 좌표 Xj의 개수

func 좌표압축() {
    let _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").compactMap { Int($0) } // [2, 4, -10, 4, -9]
    
    let sortedSet = Set(arr).sorted(by: <) // [-10, -9, 2, 4]
    var dict: [Int:Int] = [:]

    for (i, number) in sortedSet.enumerated() {
        dict[number] = i
    }
    
    var answer = ""
    
    for element in arr {
        answer += "\(dict[element]!) "
    }
    
    print(answer)
}


/*
// 시간초과
func 좌표압축() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").compactMap { Int($0) }
    var dict: [Int:Int] = [:]
    
    for (i, number) in arr.enumerated() {
        dict[i] = number
    }
    // dict = [0: 2, 1: 4, 2: -10, 3: 4, 4: -9]
    let sortedSet = Set(arr).sorted(by: <)
//    var countArr: [Int] = []
//
//    for i in 0..<n {
//        countArr.append(sortedSet.firstIndex(of: dict[i]!)!)
//    }
//
//    print(countArr)
    
    var answer = ""
    
    for i in 0..<n {
        answer += "\(sortedSet.firstIndex(of: dict[i]!)!) "
    }
    
    print(answer)
}
*/
