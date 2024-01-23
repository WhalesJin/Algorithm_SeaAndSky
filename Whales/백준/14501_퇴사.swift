// 상담원으로 일하고 있는 백준이는 퇴사를 하려고 한다.
// 오늘부터 N+1일째 되는 날 퇴사를 하기 위해서, 남은 N일 동안 최대한 많은 상담을 하려고 한다.
// 각각의 상담은 상담을 완료하는데 걸리는 기간 Ti와 상담을 했을 때 받을 수 있는 금액 Pi로 이루어져 있다.
// 상담을 적절히 했을 때, 백준이가 얻을 수 있는 최대 수익을 구하는 프로그램을 작성하시오.

func 퇴사() {
    let n = Int(readLine()!)!
    var table: [(Int, Int)] = []
    var dp = [Int](repeating: 0, count: n+1)
    
    for _ in 1...n {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        table.append((input[0], input[1]))
    }
    
    for i in stride(from: n-1, through: 0, by: -1) {
        let payDay = i + table[i].0 // 일 끝나고 돈 받는 날
        
        // i + T[i].0 > n -> X
        if payDay > n {
            dp[i] = dp[i+1]
        } else {
            // 오늘 기준
            // 일 안 했을 때 -> dp[i+1]
            // 했을 때 -> 오늘 돈 + 받는 날 돈 = table[i].1 + dp[payDay]
            dp[i] = max(dp[i+1], table[i].1 + dp[payDay])
        }
    }
    
    print(dp[0])
}
