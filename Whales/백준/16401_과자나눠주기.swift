// m명의 조카에게 같은 길이의 최대한 긴 막대 과자를 나누어주어야 한다.
// 불가능하다면 0을 출력

// 랜선자르기 참고
func 과자나눠주기() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let snacks = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = input[0] // 조카의 수
    var answer = 0
    
    var st = 1
    var en = snacks.max()!
    var mid = 0
    
    while st <= en {
        mid = (st + en) / 2
        var count = 0
        
        for length in snacks {
            count += length/mid
        }
        
        if count >= m {
            answer = mid
            st = mid + 1
        } else {
            en = mid - 1
        }
    }
    
    print(answer)
}
