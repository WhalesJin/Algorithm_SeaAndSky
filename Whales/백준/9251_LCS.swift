// LCS(Longest Common Subsequence, 최장 공통 부분문자열)문제는 두 수열이 주어졌을 때, 모두의 부분문자열 중 가장 긴 것을 찾는 문제이다. (부분문자열은 일부를 지우고 남은 것)

// 기억안나면 다시보기 https://badassdev.tistory.com/14
// 이건 강의 https://www.youtube.com/watch?v=EAXDUxVYquY
func LCS() {
    // 초기값 f(1) = 같으면 1, 아니면 0
    let string1 = readLine()!.map { $0 }
    let string2 = readLine()!.map { $0 }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: string1.count+1), count: string2.count+1)
    
    for i in 1...string2.count {
        for j in 1...string1.count {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
            
            if string1[j-1] == string2[i-1] {
                dp[i][j] = dp[i-1][j-1] + 1
            }
        }
    }
    
    // print(dp)
    print(dp.last?.last ?? 0)
}

/*
   A C A Y K P 
 C 0 1 1 1 1 1
 A 1 1 2 2 2 2
 P 1 1 2 2 2 3
 C 1 2 2 2 2 3
 A 1 2 3 3 3 3
 K 1 2 3 3 4 4
 */
