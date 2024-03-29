// 1 <= k <= 10000, 1 <= n <= 1000000, k <= n
// n개를 만들 수 있는 랜선의 최대 길이
// 1 <= x <= lines.max
func 랜선자르기() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let k = input[0]
    let n = input[1]
    var lines = [Int](repeating: 0, count: k)
    
    for i in 0..<k {
        lines[i] = Int(readLine()!)!
    }
    
    var answer: [Int] = []
    
    var minLen = 1
    var maxLen = lines.max()!
    var mid = 0
    
    while true {
        mid = (minLen + maxLen) / 2
        var counts = 0
        
        for line in lines {
            counts += line/mid
        }
        
        if counts >= n {
            answer.append(mid)
            minLen = mid + 1
        } else {
            maxLen = mid - 1
        }
        
        if minLen > maxLen {
            print(answer.max()!)
            break
        }
    }
}
