// A1, A2, ..., An 오름차순일때, 두 개의 용액을 혼합하여 만들 수 있는 0에 가장 가까운 특성값

func 용액합성하기() { // 투포인터. 이분탐색이 아니었는가
    let n = Int(readLine()!)!
    let solutions = readLine()!.split(separator: " ").compactMap { Int($0) }
    var st = 0
    var en = n - 1
    var answer = Int.max
    
    while en > st {
        let mixed = solutions[st] + solutions[en]
        
        if mixed > 0 {
            en -= 1
        } else {
            st += 1
        }
        
        if abs(answer) > abs(mixed) {
            answer = mixed
        }
    }
    
    print(answer)
}
