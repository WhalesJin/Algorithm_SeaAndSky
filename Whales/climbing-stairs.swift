// 1계단 또는 2계단씩 오를 수 있을 때, n번째 계단에 도달하는 방법의 수

func climbStairs(_ n: Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }
    
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    
    return dp[n]
}
